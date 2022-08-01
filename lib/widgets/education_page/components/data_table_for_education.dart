import 'package:aeah_work_safety/models/education.dart';
import 'package:aeah_work_safety/models/inconsistencies.dart';
import 'package:aeah_work_safety/models/person.dart';
import 'package:flutter/material.dart';

class DataTableForEducation extends StatelessWidget {
  String title;
  String detailRoute;
  List<String> columnData;
  DataTableForEducation(
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
      Education(
          educationalist: Person(
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
          educationName: 'Sağlık Konuları',
          educationInfo: 'Test',
          educationNumber: 4562,
          educationStatus: true,
          educationTime: 'time',
          educationDate: 'education date',
          educationIdentifier: Person(
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
              address: 'Test')),
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
        DataCell(Text(row.educationName.toString())),
        DataCell(Text(row.educationDate.toString())),
        DataCell(Text(row.educationalist.toString())),
        DataCell(Text(row.educationTime.toString())),
        DataCell(Text(row.educationStatus.toString())),
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
