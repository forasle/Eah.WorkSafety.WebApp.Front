import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/card_widget.dart';
import 'package:aeah_work_safety/widgets/components/column_graph.dart';
import 'package:aeah_work_safety/widgets/periodic_medical_examination_page/components/data_table_for_periodic_medical_examination.dart';
import 'package:aeah_work_safety/widgets/workAccidentPage/components/data_table_for_accident.dart';
import 'package:aeah_work_safety/widgets/components/circular_graph.dart';
import 'package:aeah_work_safety/widgets/workAccidentPage/components/search_bar.dart';
import 'package:flutter/material.dart';

class PeriodicMedicalExaminationPage extends StatelessWidget {
  const PeriodicMedicalExaminationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController horizantalController = ScrollController();
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              routingBarWidget(pageName: 'Panaroma', routeName: panaromaRoute),
              Icon(Icons.arrow_right),
              routingBarWidget(
                  pageName: 'Periyodik Muayene',
                  routeName: workAccidentPageRoute),
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
                        'Periyodik Muayene',
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
              SingleChildScrollView(
                controller: horizantalController,
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: [
                  [
                    'Kronik Hastalıklı Çalışan',
                    '500',
                    Colors.blueGrey,
                    'Tüm Kaza ve Ramak Kalalar'
                  ],
                  [
                    'Yapılmamış Muayene',
                    '399',
                    Colors.yellowAccent.shade700,
                    '-'
                  ],
                  [
                    'Yapılmamış İşe Giriş Muayenesi',
                    '199',
                    Colors.blueAccent.shade700,
                    '-'
                  ],
                  [
                    'Geçerli Muayene Oranı',
                    '0.20',
                    Colors.orangeAccent.shade700,
                    '-'
                  ],
                  [
                    'Kronik Hastalıklı Çalışan Yüzdesi',
                    '20',
                    Colors.blueGrey.shade700,
                    '-'
                  ],
                  [
                    'Ortalama Çalışma Süresi(Yıl)',
                    '9.59',
                    Colors.yellowAccent.shade700,
                    '-'
                  ],
                  ['Ortalama Yaş', '29', Colors.lightBlueAccent.shade700, '-'],
                  ['Toplam Muayene', '-', Colors.orangeAccent.shade700, '-'],
                  [
                    'Toplam Periyodik Muayene',
                    '-',
                    Colors.blueGrey.shade700,
                    '-'
                  ],
                  [
                    'Toplam İşe Giriş Muayenesi',
                    '-',
                    Colors.redAccent.shade700,
                    '-'
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
            ],
          ),
          Constant.dividerWithIndents(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 225,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.add),
                              Text('Yeni İşe Giriş Muayenesi'),
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
                    width: 220,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey.shade700),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.access_alarm_rounded),
                            Text('Yeni Periyodik Muayene'),
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
          DataTableForPeriodicMedicalExamination(
            title: 'İş Kazası',
            columnData: [
              'Sıra',
              'Tc Kimlik No',
              'Sicil No',
              'Ad Soyad',
              'Görev',
              'Departman',
              'İşe Giriş Tarihi',
              'Tür',
              'Gerekli Muayene Tarihi',
              'Adres'
            ],
          ),
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
    );
  }
}
