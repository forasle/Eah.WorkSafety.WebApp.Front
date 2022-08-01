import 'package:aeah_work_safety/models/accident.dart';
import 'package:aeah_work_safety/models/person.dart';
import 'package:flutter/material.dart';

class DataTableForAccident extends StatelessWidget {
  String title;
  String detailRoute;
  List<String> columnData;
  DataTableForAccident(
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
          accidentIdentifier: Person(
              necessaryPeriodicMedicalExaminationDate:
                  'necessaryPeriodicMedicalExaminationDate',
              periodicMedicalExaminationType: 'periodicMedicalExaminationType',
              chronicDiseases: 'null',
              address: 'test',
              department: 'test',
              identificationNumber: 123,
              name: 'Murat',
              number: 5,
              position: 'Engineer',
              registrationNumber: '25',
              startDateOfEmployment: 'Test',
              surname: 'Dogan'),
          accidentInfo: 'Test',
          accidentNumber: 123,
          referenceNumber: '456',
          date: 'Tomorrow',
          rootCauseAnalysis: true,
          lostDays: 5),
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
      selected: row.selected,
      onSelectChanged: (value) {
        Navigator.pushNamed(context, detailRoute);
      },
      cells: [
        DataCell(Text(row.referenceNumber)),
        DataCell(Text(row.accidentInfo)),
        DataCell(Text(row.accidentIdentifier.surname)),
        DataCell(Text(row.lostDays.toString())),
        DataCell(Text(row.accidentIdentifier.name)),
        DataCell(Text(row.date)),
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
