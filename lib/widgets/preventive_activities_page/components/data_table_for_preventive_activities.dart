import 'package:aeah_work_safety/models/inconsisteny.dart';
import 'package:aeah_work_safety/models/employee.dart';
import 'package:flutter/material.dart';

class DataTableForPreventiveActivities extends StatelessWidget {
  String title;
  String detailRoute;
  List<String> columnData;
  DataTableForPreventiveActivities(
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
      Inconsistency(
          supervisor: 'Murat',
          status: 'Açık',
          rootCauseAnalysis: true,
          riskScore: 125,
          relation: 'ilişki',
          referenceNumber: 'Referans',
          name: 'Asansör',
          info: 'Bozuk',
          date: 'Mayıs',
          department: 'Arge',
          identifier: Employee(

              chronicDiseases: 'null',
              id: 123,
              identificationNumber: 159,
              registrationNumber: 'Test',
              name: 'Murat',
              surname: 'Dogan',
              position: 'Arge',
              department: 'Arge',
              startDateOfEmployment: 'EA',
              address: 'Test')),
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
      selected: row.selected,
      onSelectChanged: (value) {
        Navigator.pushNamed(context, detailRoute);
      },
      cells: [
        DataCell(Text(row.referenceNumber.toString())),
        DataCell(Text(row.name.toString())),
        DataCell(Text(row.status.toString())),
        DataCell(Text(row.riskScore.toString())),
        DataCell(Text(row.info.toString())),
        DataCell(Text(row.identifier.toString())),
        DataCell(Text(row.department.toString())),
        DataCell(Text(row.supervisor.toString())),
        DataCell(Text(row.relation.toString())),
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
