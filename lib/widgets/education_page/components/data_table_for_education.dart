import 'package:aeah_work_safety/models/education.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class DataTableForEducation extends StatelessWidget {
  String title;
  String detailRoute;
  List<String> columnData;

  DataTableForEducation({Key? key, required this.title, required this.columnData, required this.detailRoute})
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
            source: _DataSource(context, detailRoute),
          ),
        ],
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  _DataSource(this.context, this.detailRoute) {
    _rows = [
      Education(
          list: employeeInstance,
          name: 'Sağlık Konuları',
          info: 'Test',
          number: 4562,
          status: true,
          time: 'time',
          date: 'education date',
          identifier: employeeInstance,)
    ];
  }

  final BuildContext context;
  late List<Education> _rows;
  final String detailRoute;

  final int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    final row = _rows[index];
    return (DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        Navigator.pushNamed(context, detailRoute);
      },
      cells: [
        DataCell(Text(row.name.toString())),
        DataCell(Text(row.date.toString())),
        DataCell(Text(row.list.toString())),
        DataCell(Text(row.time.toString())),
        DataCell(Text(row.status.toString())),
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
