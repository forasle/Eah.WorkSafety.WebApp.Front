import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/models/inconsistencies.dart';
import 'package:aeah_work_safety/models/person.dart';
import 'package:flutter/material.dart';

class DataTableForInconsistencies extends StatelessWidget {
  String title;
  List<String> columnData;
  DataTableForInconsistencies(
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
      Inconsistencies(
          inconsistenciesSupervisor: 'Murat',
          inconsistenciesStatus: 'Açık',
          inconsistenciesRootCauseAnalysis: true,
          inconsistenciesRiskScore: 125,
          inconsistenciesRelation: 'ilişki',
          inconsistenciesReferenceNumber: 'Referans',
          inconsistenciesName: 'Asansör',
          inconsistenciesInfo: 'Bozuk',
          inconsistenciesDate: 'Mayıs',
          inconsistenciesDepartment: 'Arge',
          inconsistenciesIdentifier: Person(
              chronicDiseases: 'null',
              number: 123,
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
  late List<Inconsistencies> _rows;

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
        DataCell(Text(row.inconsistenciesReferenceNumber.toString())),
        DataCell(Text(row.inconsistenciesName.toString())),
        DataCell(Text(row.inconsistenciesStatus.toString())),
        DataCell(Text(row.inconsistenciesRiskScore.toString())),
        DataCell(Text(row.inconsistenciesInfo.toString())),
        DataCell(Text(row.inconsistenciesIdentifier.toString())),
        DataCell(Text(row.inconsistenciesDepartment.toString())),
        DataCell(Text(row.inconsistenciesSupervisor.toString())),
        DataCell(Text(row.inconsistenciesRelation.toString())),
        DataCell(Text(row.inconsistenciesDate.toString())),
        DataCell(Text(row.inconsistenciesRootCauseAnalysis ? 'Evet' : 'Hayır')),
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
