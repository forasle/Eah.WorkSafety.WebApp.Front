import 'package:aeah_work_safety/constants/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DataTableDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            //color: Colors.red,
            child: PaginatedDataTable(
              columnSpacing: 30,
              showCheckboxColumn: false,
              header: Text('Çalışanlar'),
              rowsPerPage: 10,
              columns: [
                DataColumn(label: Text('Sıra No')),
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
          ),
        ],
      ),
    );
  }
}

class _Row {
  _Row(
      {required this.number,
      required this.identificationNumber,
      required this.registrationNumber,
      required this.name,
      required this.surname,
      required this.position,
      required this.department,
      required this.startDateOfEmployment,
      required this.address});

  final int number;
  final int identificationNumber;
  final String registrationNumber;
  final String name;
  final String surname;
  final String position;
  final String department;
  final String startDateOfEmployment;
  final String address;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context) {
    _rows = [
      _Row(
          number: 5,
          identificationNumber: 1655,
          registrationNumber: 'MM132',
          name: 'Murat',
          surname: 'Doğan',
          position: 'Engineer',
          department: 'Development',
          startDateOfEmployment: '01.01.2022',
          address:
              'Adres: Varlık Mh. Kazım Karabekir Cd. 07100 /Antalya Tel: +90 242 249 44 00 E -Mail: antalyaeah@saglik.gov.tr'),
      _Row(
          number: 5,
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
  late List<_Row> _rows;

  final int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    final row = _rows[index];
    //bool isScreenWide = MediaQuery.of(context).size.width >= 600;
    return (DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        showDialog(
          context: context,
          builder: (BuildContext context) => Dialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Builder(
              builder: (context) {
                return Column(
                  //direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                  children: [
                    Expanded(
                      child: DefaultTabController(
                        length: 5,
                        child: Row(
                          children: [
                            Expanded(child: personalInformation()),
                            Expanded(
                              flex: 5,
                              child: Scaffold(
                                appBar: AppBar(
                                  title: Text('Murat Doğan'),
                                  backgroundColor: Colors.transparent,
                                  //bottomOpacity: 1.0,
                                  elevation: 0.0,
                                  automaticallyImplyLeading: false,
                                  bottom: TabBar(tabs: [
                                    Tab(
                                      text: 'Çalışma Bilgileri',
                                    ),
                                    Tab(
                                      text: 'Muayeneler',
                                    ),
                                    Tab(
                                      text: 'Reçeteler/Tetkikler',
                                    ),
                                    Tab(
                                      text: 'İş Güvenliği',
                                    ),
                                    Tab(
                                      text: 'İletişim Bilgileri',
                                    ),
                                  ]),
                                ),
                                body: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: TabBarView(children: [
                                    Text('1'),
                                    Text('2'),
                                    Text('3'),
                                    Text('4'),
                                    Text('5'),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
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

  Scrollbar personalInformation() {
    ScrollController firstTabController = ScrollController();
    return Scrollbar(
      controller: firstTabController,
      child: SingleChildScrollView(
        controller: firstTabController,
        child: IntrinsicHeight(
            child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(150),
                      child: FittedBox(
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Adı Soyadı:   ',
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'TC Kimlik No:   ',
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Cinsiyeti:    ',
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text('Yaş:    '),
                              Text(
                                'Birim/Departman:    ',
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Risk Grupları:    ',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ' Murat Doğan',
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '10000000000',
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Erkek',
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '33',
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Arge',
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Alerji',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
