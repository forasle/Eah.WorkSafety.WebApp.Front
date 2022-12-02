import 'package:aeah_work_safety/models/contingency_plan.dart';
import 'package:aeah_work_safety/models/employee.dart';
import 'package:flutter/material.dart';

class DataTableForContingencyPlans extends StatelessWidget {
  final String title;
  final String detailRoute;
  final List<String> columnData;
  const DataTableForContingencyPlans(
      {Key? key,
      required this.title,
      required this.columnData,
      required this.detailRoute})
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
      ContingencyPlan(
          creatorUserId: 1,
    date: DateTime.now(),
    id: 2,
    referenceNumber: "referenceNumber",
    creationTime: DateTime.now(),
    information: "information"
    ,
    name: "name",
    planNumber: 2
    )];
  }

  final BuildContext context;
  late List<ContingencyPlan> _rows;
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
        DataCell(Text(row.name.toString())),
        DataCell(Text(row.creatorUserId.toString())),
        DataCell(Text(row.creationTime.toString())),
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
