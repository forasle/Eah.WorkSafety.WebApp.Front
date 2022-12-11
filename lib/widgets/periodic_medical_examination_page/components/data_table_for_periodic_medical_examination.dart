import 'package:aeah_work_safety/blocs/user/models/employee_response.dart';
import 'package:flutter/material.dart';

class DataTableForPeriodicMedicalExamination extends StatelessWidget {
  String title;
  List<String> columnData;

  DataTableForPeriodicMedicalExamination({Key? key, required this.title, required this.columnData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisSize: MainAxisSize.min,
        children: [
          PaginatedDataTable(
            columnSpacing: 30,
            showCheckboxColumn: false,
            header: Text(title),
            rowsPerPage: 10,
            columns: columnData.map((e) => DataColumn(label: Text(e))).toList(),
            source: _DataSource(context),
          ),
        ],
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  _DataSource(this.context) {
    _rows = [
      EmployeeResponse(
          chronicDiseases: 'null',
          address: 'test',
          department: 'test',
          identificationNumber: 123,
          name: 'Murat',
          id: 5,
          position: 'Engineer',
          registrationNumber: '25',
          startDateOfEmployment: 'Test',
          surname: 'Dogan'),
    ];
  }

  final BuildContext context;
  late List<EmployeeResponse> _rows;

  final int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    final row = _rows[index];
    return (DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {},
      cells: [
        DataCell(Text(row.id.toString())),
        DataCell(Text(row.identificationNumber.toString())),
        DataCell(Text(row.registrationNumber)),
        DataCell(Text(row.name)),
        DataCell(Text(row.position)),
        DataCell(Text(row.department)),
        DataCell(Text(row.startDateOfEmployment)),
        DataCell(Text("row.periodicMedicalExaminationType")),
        DataCell(Text("row.necessaryPeriodicMedicalExaminationDate")),
        DataCell(Text(row.address)),
      ],
    ));
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
