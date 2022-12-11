import 'package:aeah_work_safety/models/accident.dart';
import 'package:aeah_work_safety/blocs/user/models/employee_response.dart';
import 'package:flutter/material.dart';

import 'package:aeah_work_safety/constants/accident/constants.dart';

class DataTableForNearMiss extends StatelessWidget {
  final String title;
  final String detailRoute;
  final List<String> columnData;

  const DataTableForNearMiss({Key? key, required this.title, required this.columnData, required this.detailRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constant.padding,
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
            source: _DataSource(context: context, detailRoute: detailRoute),
          ),
        ],
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  _DataSource({required this.context, required this.detailRoute}) {
    _rows = [
      Accident(
          rootCauseAnalysis: true,
          referenceNumber: "referenceNumber",
          lostDays: 5,
          id: 2,
          employees: [1, 2, 3],
          date: DateTime.now(),
          creatorUserId: 1,
          accidentInfo: "accidentInfo"),
    ];
  }

  final BuildContext context;
  final String detailRoute;
  late List<Accident> _rows;

  final int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    final row = _rows[index];
    return (DataRow.byIndex(
      index: index,
      //selected: row.selected,
      onSelectChanged: (value) {
        Navigator.pushNamed(context, detailRoute);
      },
      cells: [
        DataCell(Text(row.referenceNumber)),
        DataCell(Text(row.accidentInfo)),
        DataCell(Text(row.creatorUserId.toString())),
        DataCell(Text(row.lostDays.toString())),
        DataCell(Text(row.creatorUserId.toString())),
        DataCell(Text(row.date.toString())),
        DataCell(Text(row.rootCauseAnalysis ? 'Evet' : 'Hayır')),
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
