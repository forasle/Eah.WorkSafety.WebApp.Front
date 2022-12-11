import 'package:aeah_work_safety/constants/accident/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/card_widget.dart';
import 'package:aeah_work_safety/widgets/components/column_graph.dart';
import 'package:aeah_work_safety/widgets/components/circular_graph.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:flutter/material.dart';
import 'components/data_table_for_accident.dart';
import 'components/search_bar.dart';

class AccidentPage extends StatelessWidget {
  const AccidentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController horizontalController = ScrollController();
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  RoutingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
                  const Icon(Icons.arrow_right),
                  RoutingBarWidget(pageName: 'İş Kazaları', routeName: accidentPageRoute),
                ],
              ),
            ),
          ),
          Constant.dividerWithIndent,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: Constant.padding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'İş Kazaları',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Constant.sizedBox,
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
                padding: Constant.padding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(child: ElevatedButton(onPressed: () {}, child: const Text('Rapor Yazdır'))),
                    Constant.sizedBox,
                    const Flexible(
                      child: SearchBarWidget(),
                    ),
                  ],
                ),
              ),
              Scrollbar(
                controller: horizontalController,
                child: SingleChildScrollView(
                  controller: horizontalController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: [
                    ['Kazalar', '5', Colors.blueGrey, 'Tüm Kaza ve Ramak Kalalar'],
                    ['Toplam kayıp gün', '-', Colors.yellowAccent.shade700, '-'],
                    ['Kaza Geçiren Çalışan', '-', Colors.blueAccent.shade700, '-'],
                    ['Kaza Sıklık Oranı', '-', Colors.orangeAccent.shade700, 'TOPLAM KAZA X 1M / YILLIK ADAM SAAT'],
                    ['Kaza Ağırlık Oranı', '-', Colors.blueGrey.shade700, 'TOPLAM KAYIP GÜN X 1M / YILLIK ADAM SAAT'],
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
                    ['Kaza Sıklık Oranı', '-', Colors.orangeAccent.shade700, 'TOPLAM KAZA X 1M / YILLIK ADAM SAAT'],
                    ['Kaza Ağırlık Oranı', '-', Colors.blueGrey.shade700, 'TOPLAM KAYIP GÜN X 1M / YILLIK ADAM SAAT'],
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
                      'Kaza Sıklık Oranı',
                      '-',
                      Colors.orangeAccent.shade700,
                      'KAYIP GÜNLÜ KAZA X 200,000 / YILLIK ADAM SAAT'
                    ],
                    ['Kaza Ağırlık Oranı', '-', Colors.green.shade700, 'TOPLAM KAYIP GÜN X 200,000 / YILLIK ADAM SAAT'],
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
                    ['Şiddet(Severity) Oranı', '-', Colors.green.shade700, 'KAYIP GÜN / KAYIP GÜNLÜ KAZA'],
                    [
                      'Tıbbi Müdahele Gerektiren',
                      '-',
                      Colors.blueAccent.shade700,
                      'KAYIP GÜN OLMAYAN VE MÜDAHELE GEREKTIREN'
                    ],
                    ['Toplam Olay', '-', Colors.amberAccent.shade700, 'TOPLAM RAMAK KALA + İŞ KAZASI'],
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
            ],
          ),
          Constant.dividerWithIndent,
          Padding(
            padding: Constant.padding,
            child: Wrap(
              children: [
                Padding(
                  padding: Constant.padding,
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, addNewAccident);
                        },
                        child: Padding(
                          padding: Constant.padding,
                          child: Row(
                            children: const [
                              Icon(Icons.add),
                              Text('Yeni İş Kazası Ekle'),
                            ],
                          ),
                        )),
                  ),
                ),
                Constant.sizedBox,
                Padding(
                  padding: Constant.padding,
                  child: SizedBox(
                    width: 160,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent.shade700),
                        onPressed: () {},
                        child: Padding(
                          padding: Constant.padding,
                          child: Row(
                            children: const [
                              Icon(Icons.download_rounded),
                              Text('Detaylı Excel'),
                            ],
                          ),
                        )),
                  ),
                ),
                Constant.sizedBox,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey.shade700),
                      onPressed: () {
                        Navigator.pushNamed(context, addNewAccident);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Icon(Icons.access_alarm_rounded),
                            Text('Yeni Ramak Kala'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Constant.sizedBox,
                const Padding(
                  padding: Constant.padding,
                  child: SearchBarWidget(),
                ),
              ],
            ),
          ),
          DataTableForAccident(
            title: 'İş Kazası',
            columnData: const [
              'Referans No',
              'Açıklama',
              'Tanımlayan',
              'Kayıp Gün Sayısı',
              'Etkilenenler',
              'Tarih',
              'Kök Neden Analizi Gerekiyor Mu'
            ],
            detailRoute: accidentDetailPage,
          ),
          Constant.sizedBox,
          Constant.dividerWithIndent,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rapor',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Constant.dividerWithIndent,
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
          Constant.dividerWithIndent,
        ],
      ),
    );
  }
}
