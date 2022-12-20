import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/models/occupation_diseases.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class DataTableForOccupationDiseases extends StatelessWidget {
  String title;
  List<String> columnData;

  DataTableForOccupationDiseases({Key? key, required this.title, required this.columnData}) : super(key: key);

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
      OccupationDiseases(
        occupationDiseases: '123',
        diagnosis: '123',
        diagnosisDate: '123',
        number: 123,
        owner: employeeInstance, referenceNumber: '')
    ];
  }

  final BuildContext context;
  late List<OccupationDiseases> _rows;

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
        DataCell(Text(row.referenceNumber.toString())),
        DataCell(Text(row.owner.toString())),
        DataCell(Text(row.diagnosis.toString())),
        DataCell(Text(row.diagnosisDate.toString())),
        DataCell(Text(row.owner.department)),
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
