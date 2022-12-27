import 'dart:convert';

import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee.dart';
import 'package:aeah_work_safety/blocs/employee/repository/employee_repository.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:aeah_work_safety/widgets/accident_page/components/search_bar.dart';
import 'package:flutter/material.dart';

class AdvancedDataTable extends StatelessWidget {
  const AdvancedDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchBarWidget(),
        AdvancedPaginatedDataTable(

          showCheckboxColumn: false,
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
            source: DataSource(context)),
      ],
    );
  }
}
class DataSource extends AdvancedDataTableSource<Employee>{
  DataSource(this.context);
  final BuildContext context;
  List<Employee> _rows=[];
  final int _selectedCount = 0;

  @override
  Future<RemoteDataSourceDetails<Employee>> getNextPage(NextPageRequest pageRequest) async{
    final EmployeeRepository _employeeRepository = locator<EmployeeRepository>();
    final employeeResponse = await _employeeRepository.getEmployeeData(page: ((pageRequest.offset/10)+1).toInt(), pageSize: pageRequest.pageSize);

    if(employeeResponse.succeeded){
      _rows = employeeResponse.data;
      return RemoteDataSourceDetails(
          employeeResponse.totalRecords,employeeResponse.data);
    }
    else {
      throw Exception('Unable to query remote server');
    }
  }

  @override
  DataRow? getRow(int index) {
    final row = _rows[index];
    return (DataRow.byIndex(
      index: index,

      //selected: row.selected,
      onSelectChanged: (value) {
        Navigator.pushNamed(context, workersDetailPageRoute,arguments: row);
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
  int get selectedRowCount => _selectedCount;

}
