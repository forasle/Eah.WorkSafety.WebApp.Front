import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/employee/constants.dart';

class DataTableForEmployee extends StatelessWidget {
  const DataTableForEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constant.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisSize: MainAxisSize.min,
        children: [
          PaginatedDataTable(
            columnSpacing: 30,
            showCheckboxColumn: false,
            header: const Text('Çalışanlar'),
            rowsPerPage: 10,
            columns: const [
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
      Employee(
          chronicDiseases: 'null',
          id: 1,
          identificationNumber: 1655,
          registrationNumber: 'MM132',
          name: 'Murat',
          surname: 'Doğan',
          position: 'Engineer',
          department: 'Development',
          startDateOfEmployment: '01.01.2022',
          address:
              'Adres: Varlık Mh. Kazım Karabekir Cd. 07100 /Antalya Tel: +90 242 249 44 00 E -Mail: antalyaeah@saglik.gov.tr'),
      Employee(

          chronicDiseases: 'null',
          id: 2,
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
  late List<Employee> _rows;

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
        DataCell(Text(row.id.toString())),
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
