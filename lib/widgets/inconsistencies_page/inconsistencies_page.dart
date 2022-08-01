import 'package:aeah_work_safety/models/accident.dart';
import 'package:aeah_work_safety/models/inconsistencies.dart';
import 'package:aeah_work_safety/models/person.dart';
import 'package:aeah_work_safety/widgets/components/circular_graph.dart';
import 'package:aeah_work_safety/widgets/components/column_graph.dart';
import 'package:aeah_work_safety/widgets/near_miss_page/components/data_table_for_inconsistencies.dart';
import 'package:aeah_work_safety/widgets/workAccidentPage/components/data_table_for_accident.dart';
import 'package:aeah_work_safety/widgets/workAccidentPage/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/card_widget.dart';

class InconsistenciesPage extends StatelessWidget {
  const InconsistenciesPage({Key? key}) : super(key: key);

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
                  pageName: 'Uygunsuzluklar',
                  routeName: dayWithoutAccidentPageRoute),
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
                        'Uygunsuzluklar',
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
                    ['Toplam Uygunsuzluk', '5', Colors.blueGrey, '-'],
                    [
                      'Ortalama Yaş(Gün)',
                      '-',
                      Colors.yellowAccent.shade700,
                      '-'
                    ],
                    ['Açık', '-', Colors.blueAccent.shade700, '-'],
                    ['Tamamlanmış', '-', Colors.orangeAccent.shade700, '-'],
                    ['Reddedilmiş', '-', Colors.blueGrey.shade700, '-'],
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.add),
                                  Text('Yeni Saha Denetimi'),
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
                                primary: Colors.greenAccent.shade700),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, addNewInconsistencies);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.download_rounded),
                                  Text('Yeni Uygunsuzluk'),
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
                              primary: Colors.blueGrey.shade700),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.access_alarm_rounded),
                                Text('Detaylı Excel'),
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
              dividerWithIndents(),
              DataTableForInconsistencies(
                  title: 'Uygunsuzluklar',
                  columnData: [
                    'Referans No',
                    'Ad',
                    'Durum',
                    'Risk Skoru',
                    'Açıklama',
                    'Tanımlayan',
                    'Departman',
                    'Süpervizör',
                    'ilişki',
                    'Tarih',
                    'Kök Neden Analizi Gerekiyor Mu'
                  ],
                  detailRoute: inconsistenciesDetailPage),
              SizedBox(
                height: 10,
              ),
              dividerWithIndents(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircularGraph(
                      title: 'Departman',
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
                      title: 'İlişki/Kaynak',
                      chartData: [
                        ChartData('David', 25),
                        ChartData('Steve', 38),
                        ChartData('Jack', 34),
                        ChartData('Others', 52),
                      ],
                    ),
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
