import 'package:aeah_work_safety/constants/periodic_medical_examination/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/card_widget.dart';
import 'package:aeah_work_safety/widgets/components/column_graph.dart';
import 'package:aeah_work_safety/widgets/periodic_medical_examination_page/components/data_table_for_periodic_medical_examination.dart';
import 'package:aeah_work_safety/widgets/components/circular_graph.dart';
import 'package:aeah_work_safety/widgets/accident_page/components/search_bar.dart';
import 'package:flutter/material.dart';

class PeriodicMedicalExaminationPage extends StatelessWidget {
  const PeriodicMedicalExaminationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController horizontalController = ScrollController();
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RoutingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
              const Icon(Icons.arrow_right),
              RoutingBarWidget(pageName: 'Periyodik Muayene', routeName: accidentPageRoute),
            ],
          ),
          Constant.dividerWithIndent,
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
                    Constant.sizedBoxHeight,
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
                    Constant.sizedBoxWidth,
                    const Flexible(
                      child: SearchBarWidget(),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                controller: horizontalController,
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: [
                  ['Kronik Hastalıklı Çalışan', '500', Colors.blueGrey, 'Tüm Kaza ve Ramak Kalalar'],
                  ['Yapılmamış Muayene', '399', Colors.yellowAccent.shade700, '-'],
                  ['Yapılmamış İşe Giriş Muayenesi', '199', Colors.blueAccent.shade700, '-'],
                  ['Geçerli Muayene Oranı', '0.20', Colors.orangeAccent.shade700, '-'],
                  ['Kronik Hastalıklı Çalışan Yüzdesi', '20', Colors.blueGrey.shade700, '-'],
                  ['Ortalama Çalışma Süresi(Yıl)', '9.59', Colors.yellowAccent.shade700, '-'],
                  ['Ortalama Yaş', '29', Colors.lightBlueAccent.shade700, '-'],
                  ['Toplam Muayene', '-', Colors.orangeAccent.shade700, '-'],
                  ['Toplam Periyodik Muayene', '-', Colors.blueGrey.shade700, '-'],
                  ['Toplam İşe Giriş Muayenesi', '-', Colors.redAccent.shade700, '-'],
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
          Constant.dividerWithIndent,
          Padding(
            padding: Constant.padding,
            child: Wrap(
              children: [
                Padding(
                  padding: Constant.padding,
                  child: SizedBox(
                    width: 225,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: Constant.padding,
                          child: Row(
                            children: const [
                              Icon(Icons.add),
                              Text('Yeni İşe Giriş Muayenesi'),
                            ],
                          ),
                        )),
                  ),
                ),
                Constant.sizedBoxWidth,
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
                Constant.sizedBoxWidth,
                Padding(
                  padding: Constant.padding,
                  child: SizedBox(
                    width: 230,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey.shade700),
                      onPressed: () {},
                      child: Padding(
                        padding: Constant.padding,
                        child: Row(
                          children: const [
                            Icon(Icons.access_alarm_rounded),
                            Text('Yeni Periyodik Muayene'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Constant.sizedBoxWidth,
                const Padding(
                  padding: Constant.padding,
                  child: SearchBarWidget(),
                ),
              ],
            ),
          ),
          DataTableForPeriodicMedicalExamination(
            title: 'İş Kazası',
            columnData: const [
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
          Constant.sizedBoxHeight,
          Constant.dividerWithIndent,
          Padding(
            padding: Constant.padding,
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
                const ColumnGraph(
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
