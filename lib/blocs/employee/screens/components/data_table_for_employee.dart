import 'dart:convert';

import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AdvancedDataTable extends StatelessWidget {
  const AdvancedDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdvancedPaginatedDataTable(

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
        source: DataSource(context));
  }
}
class DataSource extends AdvancedDataTableSource<Employee>{
  DataSource(this.context);
  final BuildContext context;
  List<Employee> _rows=[];
  final int _selectedCount = 0;

  @override
  Future<RemoteDataSourceDetails<Employee>> getNextPage(NextPageRequest pageRequest) async{
    var baseAPI=BaseAPI();
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    baseAPI.headers["Authorization"]= "Bearer $token";
    double page = (pageRequest.offset/10)+1;
    var requestUri = Uri.parse(baseAPI.employeePath+"?pageNumber="+(page.toInt()).toString()+"&pageSize="+pageRequest.pageSize.toString());
    final employeeResponse = await http.get(requestUri, headers:baseAPI.headers);
    if(employeeResponse.statusCode==200){
      final employeeResponseJson = jsonDecode(employeeResponse.body);
      EmployeeResponse employeeResponseModel =EmployeeResponse.fromJson(employeeResponseJson);
      _rows = employeeResponseModel.data;
      return RemoteDataSourceDetails(
          employeeResponseModel.totalRecords,employeeResponseModel.data);
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
