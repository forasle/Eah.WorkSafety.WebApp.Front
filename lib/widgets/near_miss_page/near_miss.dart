import 'package:aeah_work_safety/widgets/components/circular_graph.dart';
import 'package:aeah_work_safety/widgets/components/column_graph.dart';
import 'package:aeah_work_safety/widgets/workAccidentPage/components/data_table_for_accident.dart';
import 'package:aeah_work_safety/widgets/workAccidentPage/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/card_widget.dart';

class NearMissPage extends StatelessWidget {
  const NearMissPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController horizantalController = ScrollController();
    return CustomScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              routingBarWidget(pageName: 'Panaroma', routeName: panaromaRoute),
              Icon(Icons.arrow_right),
              routingBarWidget(
                  pageName: 'Ramak Kala',
                  routeName: dayWithoutAccidentPageRoute),
            ],
          ),
          Constant.dividerWithIndents(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Ramak Kala',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        '(Yetki seviyenize göre görüntüleyebildiğiniz liste & raporlar)',
                        style: Theme.of(context).textTheme.overline,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Rapor Yazdır'))),
                    SizedBox(width: 10),
                    Flexible(
                      child: SearchBarWidget(),
                    ),
                  ],
                ),
              ),
              Scrollbar(
                controller: horizantalController,
                child: SingleChildScrollView(
                  controller: horizantalController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: [
                    [
                      'Ramak Kalalar',
                      '5',
                      Colors.blueGrey,
                      'TÜM KAZA VE RAMAK KALALAR'
                    ],
                    [
                      'Toplam kayıp gün',
                      '-',
                      Colors.yellowAccent.shade700,
                      '-'
                    ],
                    [
                      'Kaza Geçiren Çalışan',
                      '-',
                      Colors.blueAccent.shade700,
                      '-'
                    ],
                    [
                      'Kaza Sıklık Oranı',
                      '-',
                      Colors.orangeAccent.shade700,
                      'TOPLAM KAZA X 1M / YILLIK ADAM SAAT'
                    ],
                    [
                      'Kaza Ağırlık Oranı',
                      '-',
                      Colors.blueGrey.shade700,
                      'TOPLAM KAYIP GÜN X 1M / YILLIK ADAM SAAT'
                    ],
                    [
                      'Kayıp Günlü Kaza Sıklık Oranı',
                      '-',
                      Colors.yellowAccent.shade700,
                      'KAYIP GÜNLÜ KAZA X 1M / YILLIK ADAM SAAT'
                    ],
                    [
                      'İlkyardım Gerekirtiren Kaza Sıklık Oranı',
                      '-',
                      Colors.lightBlueAccent.shade700,
                      'İLKYARDIM GEREKTIREN KAZA X 1M/YILLIK ADAM SAAT'
                    ],
                    [
                      'Kaza Sıklık Oranı',
                      '-',
                      Colors.orangeAccent.shade700,
                      'TOPLAM KAZA X 1M / YILLIK ADAM SAAT'
                    ],
                    [
                      'Kaza Ağırlık Oranı',
                      '-',
                      Colors.blueGrey.shade700,
                      'TOPLAM KAYIP GÜN X 1M / YILLIK ADAM SAAT'
                    ],
                    [
                      'Kayıp Günlü Kaza Sıklık Oranı',
                      '-',
                      Colors.redAccent.shade700,
                      'KAYIP GÜNLÜ KAZA X 1M / YILLIK ADAM SAAT'
                    ],
                    [
                      'İlkyardım Gerekirtiren Kaza Sıklık Oranı',
                      '-',
                      Colors.blueAccent.shade700,
                      'İLKYARDIM GEREKTIREN KAZA X 1M/YILLIK ADAM SAAT'
                    ],
                    [
                      'Kayıp Günlü Kaza Sıklık Oranı',
                      '-',
                      Colors.orangeAccent.shade700,
                      'KAYIP GÜNLÜ KAZA X 200,000 / YILLIK ADAM SAAT'
                    ],
                    [
                      'Kaza Ağırlık Oranı',
                      '-',
                      Colors.green.shade700,
                      'TOPLAM KAYIP GÜN X 200,000 / YILLIK ADAM SAAT'
                    ],
                    [
                      'Kayıp Günlü Kaza Sıklık Oranı',
                      '-',
                      Colors.blueAccent.shade700,
                      'KAYIP GÜNLÜ KAZA X 200,000 / YILLIK ADAM SAAT'
                    ],
                    [
                      'İlkyardım Gerekirtiren Kaza Sıklık Oranı',
                      '-',
                      Colors.blueGrey.shade700,
                      'İLKYARDIM GEREKTIREN KAZA X 200,000/YILLIK ADAM SAAT'
                    ],
                    [
                      'Şiddet(Severity) Oranı',
                      '-',
                      Colors.green.shade700,
                      'KAYIP GÜN / KAYIP GÜNLÜ KAZA'
                    ],
                    [
                      'Tıbbi Müdahele Gerektiren',
                      '-',
                      Colors.blueAccent.shade700,
                      'KAYIP GÜN OLMAYAN VE MÜDAHELE GEREKTIREN'
                    ],
                    [
                      'Toplam Olay',
                      '-',
                      Colors.amberAccent.shade700,
                      'TOPLAM RAMAK KALA + İŞ KAZASI'
                    ],
                  ]
                          .map(
                            (e) => CardWidget(
                                cardText: e[0] as String,
                                cardDouble: e[1] as String,
                                cardColor: e[2] as Color,
                                cardSubText: e[3] as String),
                          )
                          .toList()),
                ),
              ),
              Constant.dividerWithIndents(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, addNewWorkAccidentOrNearMiss);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.add),
                                  Text('Yeni İş Kazası Ekle'),
                                ],
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amberAccent.shade700),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.download_rounded),
                                  Text('Detaylı Excel'),
                                ],
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey.shade700),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, addNewWorkAccidentOrNearMiss);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.access_alarm_rounded),
                                Text('Yeni Ramak Kala'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SearchBarWidget(),
                    ),
                  ],
                ),
              ),
              Constant.dividerWithIndents(),
              DataTableForAccident(
                  title: 'Ramak Kalalar',
                  columnData: [
                    'Referans No',
                    'Açıklama',
                    'Tanımlayan',
                    'Kayıp Gün Sayısı',
                    'Etkilenenler',
                    'Tarih',
                    'Kök Neden Analizi Gerekiyor Mu'
                  ],
                  detailRoute: nearMissDetailPage),
              SizedBox(
                height: 10,
              ),
              Constant.dividerWithIndents(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Rapor',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Constant.dividerWithIndents(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircularGraph(
                      title: 'Kaza/Ramak Kala',
                      chartData: [
                        ChartData('David', 25),
                        ChartData('Steve', 38),
                        ChartData('Jack', 34),
                        ChartData('Others', 52),
                        ChartData('Others', 52),
                        ChartData('Others', 52),
                        ChartData('Others', 52),
                        ChartData('Others', 52)
                      ],
                    ),
                    CircularGraph(
                      title: 'Kök Neden Gereksinimi',
                      chartData: [
                        ChartData('David', 25),
                        ChartData('Steve', 38),
                        ChartData('Jack', 34),
                        ChartData('Others', 52),
                      ],
                    ),
                    CircularGraph(
                      title: 'Zarar',
                      chartData: [
                        ChartData('David', 25),
                        ChartData('Steve', 38),
                        ChartData('Jack', 34),
                      ],
                    ),
                    CircularGraph(
                      title: 'Operasyonel Kaza/Rutin İş Kazası',
                      chartData: [
                        ChartData('David', 25),
                        ChartData('Steve', 38),
                      ],
                    ),
                    CircularGraph(
                      title: 'Departmanlar',
                      chartData: [
                        ChartData('David', 25),
                      ],
                    ),
                    ColumnGraph(
                      title: 'Dönemsel Kaza Adedi',
                    )
                  ],
                ),
              ),
              Constant.dividerWithIndents(),
            ],
          ),
        ],
      ),
    );
  }
}
