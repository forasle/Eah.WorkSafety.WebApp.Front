import 'package:aeah_work_safety/models/inconsisteny.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:flutter/material.dart';

class DataTableForPreventiveActivities extends StatelessWidget {
  final String title;
  final String detailRoute;
  final List<String> columnData;

  const DataTableForPreventiveActivities(
      {Key? key, required this.title, required this.columnData, required this.detailRoute})
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
      Inconsistency(
          information: "information",
          referenceNumber: "referenceNumber",
          id: 1,
          date: DateTime.now(),
          creatorUserId: 2,
          department: "department",
          riskScore: 5,
          rootCauseAnalysisRequirement: false,
          status: true)
    ];
  }

  final BuildContext context;
  late List<Inconsistency> _rows;
  final String detailRoute;

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
        DataCell(Text(row.referenceNumber.toString())),
        DataCell(Text(row.creatorUserId.toString())),
        DataCell(Text(row.status.toString())),
        DataCell(Text(row.riskScore.toString())),
        DataCell(Text(row.information.toString())),
        DataCell(Text(row.creatorUserId.toString())),
        DataCell(Text(row.department.toString())),
        DataCell(Text(row.creatorUserId.toString())),
        DataCell(Text(row.information.toString())),
        DataCell(Text(row.date.toString())),
        DataCell(Text(row.rootCauseAnalysisRequirement ? 'Evet' : 'Hayır')),
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
