import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/models/inconsistencies.dart';
import 'package:aeah_work_safety/models/occupation_diseases.dart';
import 'package:aeah_work_safety/models/person.dart';
import 'package:flutter/material.dart';

class DataTableForOccupationDiseases extends StatelessWidget {
  String title;
  List<String> columnData;
  DataTableForOccupationDiseases(
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
      OccupationDiseases(
        occupationDiseases: '123',
        occupationDiseasesDiagnosis: '123',
        occupationDiseasesDiagnosisdate: '123',
        occupationDiseasesNumber: 123,
        occupationDiseasesOwner: Person(
            necessaryPeriodicMedicalExaminationDate:
                'necessaryPeriodicMedicalExaminationDate',
            periodicMedicalExaminationType: 'periodicMedicalExaminationType',
            chronicDiseases: 'null',
            number: 123,
            identificationNumber: 159,
            registrationNumber: 'Test',
            name: 'Murat',
            surname: 'Dogan',
            position: 'Arge',
            department: 'Arge',
            startDateOfEmployment: 'EA',
            address: 'Test'),
        occupationDiseasesreferenceNumber: 'position',
      )
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
        DataCell(Text(row.occupationDiseasesreferenceNumber.toString())),
        DataCell(Text(row.occupationDiseasesOwner.toString())),
        DataCell(Text(row.occupationDiseasesDiagnosis.toString())),
        DataCell(Text(row.occupationDiseasesDiagnosisdate.toString())),
        DataCell(Text(row.occupationDiseasesOwner.department)),
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
