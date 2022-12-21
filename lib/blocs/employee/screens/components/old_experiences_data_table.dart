import 'package:flutter/material.dart';

class OldExperiencesDataTable extends StatelessWidget {
  const OldExperiencesDataTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 12,
      columns: const <DataColumn>[
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
      rows: const <DataRow>[
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
