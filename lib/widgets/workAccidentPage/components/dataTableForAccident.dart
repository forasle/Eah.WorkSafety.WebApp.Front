import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/models/accident.dart';
import 'package:aeah_work_safety/models/person.dart';
import 'package:flutter/material.dart';

class DataTableForAccident extends StatelessWidget {
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
            header: Text('İş Kazaları'),
            rowsPerPage: 10,
            columns: [
              DataColumn(
                label: Text('Referans No'),
              ),
              DataColumn(label: Text('Açıklama')),
              DataColumn(label: Text('Tanımlayan')),
              DataColumn(label: Text('Kayıp Gün Sayısı')),
              DataColumn(label: Text('Etkilenenler')),
              DataColumn(label: Text('Tarih')),
              DataColumn(label: Text('Kök Neden Analizi Gerekiyor Mu')),
            ],
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
      Accident(
          accidentIdentifier: Person(
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
  late List<Accident> _rows;

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
