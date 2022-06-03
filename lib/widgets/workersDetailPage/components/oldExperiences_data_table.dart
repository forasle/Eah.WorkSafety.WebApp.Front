import 'package:flutter/material.dart';

class oldExperiencesDataTable extends StatelessWidget {
  const oldExperiencesDataTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 12,
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            'Kurum',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DataColumn(label: VerticalDivider()),
        DataColumn(
          label: Text(
            'İş Kolu',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DataColumn(label: VerticalDivider()),
        DataColumn(
          label: Text(
            'Görevi',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DataColumn(label: VerticalDivider()),
        DataColumn(
          label: Text(
            'Giriş - Çıkış Tarihi',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
      rows: <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              'Nasa',
              overflow: TextOverflow.ellipsis,
            )),
            DataCell(VerticalDivider()),
            DataCell(Text(
              'Arge Engineer',
              overflow: TextOverflow.ellipsis,
            )),
            DataCell(VerticalDivider()),
            DataCell(Text(
              'EEE and CE',
              overflow: TextOverflow.ellipsis,
            )),
            DataCell(VerticalDivider()),
            DataCell(Text(
              '01-01-2023 - 1 Oca 2022',
              overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
      ],
    );
  }
}
