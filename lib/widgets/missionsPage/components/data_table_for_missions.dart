import 'package:aeah_work_safety/models/mission.dart';
import 'package:aeah_work_safety/models/person.dart';
import 'package:flutter/material.dart';

class DataTableForMissions extends StatelessWidget {
  String title;
  List<String> columnData;
  DataTableForMissions(
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
      Mission(
          missionDate: 'tarih',
          missionDeadline: 'bitiş tarihi',
          missionDepartment: 'Arge',
          missionId: 123,
          missionIdentifier: Person(
              necessaryPeriodicMedicalExaminationDate:
                  'necessaryPeriodicMedicalExaminationDate',
              periodicMedicalExaminationType: 'periodicMedicalExaminationType',
              chronicDiseases: 'null',
              address: 'test',
              department: 'test',
              identificationNumber: 123,
              name: 'Murat',
              id: 5,
              position: 'Engineer',
              registrationNumber: '25',
              startDateOfEmployment: 'Test',
              surname: 'Dogan'),
          missionName: 'Tehlike',
          missionOwner: Person(
              necessaryPeriodicMedicalExaminationDate:
                  'necessaryPeriodicMedicalExaminationDate',
              periodicMedicalExaminationType: 'periodicMedicalExaminationType',
              chronicDiseases: 'null',
              address: 'test',
              department: 'test',
              identificationNumber: 123,
              name: 'Murat',
              id: 5,
              position: 'Engineer',
              registrationNumber: '25',
              startDateOfEmployment: 'Test',
              surname: 'Dogan'),
          missionStatus: true),
    ];
  }

  final BuildContext context;
  late List<Mission> _rows;

  final int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    final row = _rows[index];
    return (DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {},
      cells: [
        DataCell(Text(row.missionName)),
        DataCell(Text(row.missionDepartment)),
        DataCell(Text(row.missionIdentifier.surname)),
        DataCell(Text(row.missionOwner.name)),
        DataCell(Text(row.missionDate)),
        DataCell(Text(row.missionDeadline)),
        DataCell(Text(row.missionStatus ? 'Tamamlanmış' : 'Tamamlanmamış')),
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
