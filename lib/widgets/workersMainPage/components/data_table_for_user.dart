import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/models/person.dart';
import 'package:flutter/material.dart';

class DataTableForUser extends StatelessWidget {
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
            header: Text('Çalışanlar'),
            rowsPerPage: 10,
            columns: [
              DataColumn(
                label: Text('Sıra No'),
              ),
              DataColumn(label: Text('Tc Kimlik No')),
              DataColumn(label: Text('Sicil No')),
              DataColumn(label: Text('Ad Soyad')),
              DataColumn(label: Text('Görev')),
              DataColumn(label: Text('Departman')),
              DataColumn(label: Text('İşe Giriş Tarihi')),
              DataColumn(label: Text('Adres')),
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
      Person(
          chronicDiseases: 'null',
          number: 1,
          identificationNumber: 1655,
          registrationNumber: 'MM132',
          name: 'Murat',
          surname: 'Doğan',
          position: 'Engineer',
          department: 'Development',
          startDateOfEmployment: '01.01.2022',
          address:
              'Adres: Varlık Mh. Kazım Karabekir Cd. 07100 /Antalya Tel: +90 242 249 44 00 E -Mail: antalyaeah@saglik.gov.tr'),
      Person(
          chronicDiseases: 'null',
          number: 2,
          identificationNumber: 1655,
          registrationNumber: 'MM132',
          name: 'Selda',
          surname: 'Doğan',
          position: 'ATT',
          department: 'Development',
          startDateOfEmployment: '01.01.2022',
          address:
              'Adres: Varlık Mh. Kazım Karabekir Cd. 07100 /Antalya Tel: +90 242 249 44 00 E -Mail: antalyaeah@saglik.gov.tr')
    ];
  }

  final BuildContext context;
  late List<Person> _rows;

  final int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    final row = _rows[index];
    return (DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        print('Test');
        Navigator.pushNamed(context, workersDetailPageRoute);
      },
      cells: [
        DataCell(Text(row.number.toString())),
        DataCell(Text(row.identificationNumber.toString())),
        DataCell(Text(row.registrationNumber)),
        DataCell(Text(row.name + ' ' + row.surname)),
        DataCell(Text(row.position)),
        DataCell(Text(row.department)),
        DataCell(Text(row.startDateOfEmployment)),
        DataCell(Text(row.address)),
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
