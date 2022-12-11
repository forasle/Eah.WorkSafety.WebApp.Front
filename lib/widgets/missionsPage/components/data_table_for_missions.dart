import 'package:aeah_work_safety/models/mission.dart';
import 'package:aeah_work_safety/blocs/user/models/employee_response.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/mission/constants.dart';

class DataTableForMissions extends StatelessWidget {
  final String title;
  final List<String> columnData;

  const DataTableForMissions({Key? key, required this.title, required this.columnData}) : super(key: key);

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
          date: 'tarih',
          deadline: 'bitiş tarihi',
          department: 'Arge',
          id: 123,
          identifier: EmployeeResponse(
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
          name: 'Tehlike',
          owner: EmployeeResponse(
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
          status: true),
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
        DataCell(Text(row.name)),
        DataCell(Text(row.department)),
        DataCell(Text(row.identifier.surname)),
        DataCell(Text(row.owner.name)),
        DataCell(Text(row.date)),
        DataCell(Text(row.deadline)),
        DataCell(Text(row.status ? 'Tamamlanmış' : 'Tamamlanmamış')),
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
