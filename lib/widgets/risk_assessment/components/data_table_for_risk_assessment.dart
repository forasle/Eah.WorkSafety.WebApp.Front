import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/models/risk_assessment.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/risk_assessment/constants.dart';

class DataTableForRiskAssessment extends StatelessWidget {
  final String title;
  final String detailRoute;
  final List<String> columnData;

  const DataTableForRiskAssessment({Key? key, required this.title, required this.columnData, required this.detailRoute})
      : super(key: key);

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
      RiskAssessment(
          riskAssessmentCreationTime: 'Risk Değerlendirme Oluşturma Tarihi',
          riskAssessmentDate: 'Risk Değerlendirme Tarihi',
          riskAssessmentInfo: 'Risk Değerlendirme Açıklaması',
          riskAssessmentMethod: 'FineKinney',
          name: 'Risk Değerlendirme Adı',
          referenceNumber: 'Risk Değerlendirme Referans No',
          revisionDate: 'Risk Değerlendirme Revizyon Tarihi',
          riskAssessmentIdentifier: employeeInstance,)
    ];
  }

  final BuildContext context;
  late List<RiskAssessment> _rows;
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
        DataCell(Text(row.referenceNumber.toString())),
        DataCell(Text(row.revisionDate.toString())),
        DataCell(Text(row.riskAssessmentMethod.toString())),
        DataCell(Text(row.riskAssessmentCreationTime.toString())),
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
