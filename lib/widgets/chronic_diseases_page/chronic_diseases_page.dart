import 'package:aeah_work_safety/widgets/chronic_diseases_page/components/data_table_for_chronic_diseases.dart';
import 'package:aeah_work_safety/widgets/components/circular_graph.dart';
import 'package:aeah_work_safety/widgets/components/column_graph.dart';
import 'package:aeah_work_safety/widgets/preventive_activities_page/components/data_table_for_preventive_activities.dart';
import 'package:aeah_work_safety/widgets/workAccidentPage/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/card_widget.dart';

class ChronicDiseasesPage extends StatelessWidget {
  const ChronicDiseasesPage({Key? key}) : super(key: key);

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
              const Icon(Icons.arrow_right),
              routingBarWidget(
                  pageName: 'Kronik Hastalık',
                  routeName: chronicDiseasesPageRoute),
            ],
          ),
          dividerWithIndents(),
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
                        'Kronik Hastalık',
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
                    ['Kronik Hast. Çalışan', '5984', Colors.blueGrey, '-'],
                    [
                      'Kronik Hast. Çalışan Yüzdesi',
                      '2545',
                      Colors.blueGrey.shade700,
                      'KRONIK HASTALIKLI ÇALIŞAN / TOPLAM ÇALIŞAN * 100'
                    ],
                    [
                      'Ort. Çalışma Süresi (Yıl)',
                      '1240',
                      Colors.blueAccent.shade700,
                      '-'
                    ],
                    ['Ortalama Yaş', '28', Colors.greenAccent.shade700, '-'],
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
              dividerWithIndents(),
              DataTableForChronicDiseases(
                title: 'Eğitim',
                columnData: const [
                  'Sıra',
                  'TC Kimlik No',
                  'Sicil No',
                  'Ad Soyad',
                  'Görev',
                  'Departman',
                  'İşe Giriş Tarihi',
                  'Tanı',
                  'Adres',
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //dividerWithIndents(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Rapor',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),

              dividerWithIndents(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircularGraph(
                      title: 'Vucut Kitle Oranı',
                      chartData: [
                        ChartData('Obez 1', 25),
                        ChartData('Normal', 38),
                        ChartData('Obez 2', 34),
                        ChartData('Obez 3', 52),
                        ChartData('Fazla Kilolu', 52),
                        ChartData('Zayıf', 52),
                        ChartData('Belirtilmemiş', 52),
                      ],
                    ),
                    CircularGraph(
                      title: 'Sigara Kullanımı',
                      chartData: [
                        ChartData('Evet', 25),
                        ChartData('Belirtilmemiş', 38),
                      ],
                    ),
                    CircularGraph(
                      title: 'Alkol Kullanımı',
                      chartData: [
                        ChartData('Evet', 25),
                        ChartData('Hayır', 38),
                        ChartData('Belirtilmemiş', 34),
                      ],
                    ),
                    CircularGraph(
                      title: 'Cisiyet Dağılımı',
                      chartData: [
                        ChartData('Erkek', 25),
                        ChartData('Kadın', 38),
                      ],
                    ),
                    ColumnGraph(
                      title: 'Kronik Hastalık Kümeleri',
                    )
                  ],
                ),
              ),
              dividerWithIndents(),
            ],
          ),
        ],
      ),
    );
  }
}
