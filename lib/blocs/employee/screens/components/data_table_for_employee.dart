import 'package:aeah_work_safety/blocs/employee/models/employee.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/employee/constants.dart';

class DataTableForEmployee extends StatelessWidget {
  final EmployeeResponse employeeResponse;
  const DataTableForEmployee({Key? key, required this.employeeResponse}) : super(key: key);

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
            source: _DataSource(context,employeeResponse),
          ),
        ],
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  final EmployeeResponse employeeResponse;

  _DataSource(this.context, this.employeeResponse) {
    _rows = employeeResponse.data;
  }
  final BuildContext context;
  late List<Employee> _rows;

  final int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    final row = _rows[index];
    return (DataRow.byIndex(
      index: index,
      //selected: row.selected,
      onSelectChanged: (value) {
        Navigator.pushNamed(context, workersDetailPageRoute,arguments: employeeResponse.data[index]);
      },
      cells: [
       DataCell(Text(row.id.toString())),
       DataCell(Text(row.identificationNumber.toString())),
       DataCell(Text(row.registrationNumber)),
       DataCell(Text(row.name + ' ' + row.surname)),
       DataCell(Text(row.position)),
       DataCell(Text(row.department)),
       DataCell(Text(row.startDateOfEmployment.toString())),
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
