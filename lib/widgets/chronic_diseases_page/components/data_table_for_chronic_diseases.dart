import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/models/employee.dart';
import 'package:flutter/material.dart';

class DataTableForChronicDiseases extends StatelessWidget {
  final String title;
  final List<String> columnData;
  const DataTableForChronicDiseases(
      {Key? key, required this.title, required this.columnData})
      : super(key: key);

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
      Employee(
          id: 123,
          identificationNumber: 123,
          registrationNumber: '123',
          name: 'name',
          surname: 'surname',
          position: 'position',
          department: 'department',
          startDateOfEmployment: 'startDateOfEmployment',
          address: 'address',
          chronicDiseases: 'chronicDiseases',
          )
    ];
  }

  final BuildContext context;
  late List<Employee> _rows;

  final int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    final row = _rows[index];
    return (DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        Navigator.pushNamed(context, workersDetailPageRoute);
      },
      cells: [
        DataCell(Text(row.id.toString())),
        DataCell(Text(row.identificationNumber.toString())),
        DataCell(Text(row.identificationNumber.toString())),
        DataCell(Text(row.name.toString())),
        DataCell(Text(row.position.toString())),
        DataCell(Text(row.department.toString())),
        DataCell(Text(row.startDateOfEmployment.toString())),
        DataCell(Text(row.chronicDiseases.toString())),
        DataCell(Text(row.address.toString())),
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
