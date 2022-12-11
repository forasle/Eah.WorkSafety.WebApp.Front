import 'package:aeah_work_safety/widgets/components/circular_graph.dart';
import 'package:aeah_work_safety/widgets/occupational_diseases_page/components/data_table_for_occupation_diseases.dart';
import 'package:aeah_work_safety/widgets/accident_page/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/occupation_disease/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/card_widget.dart';

class OccupationDiseasesPage extends StatelessWidget {
  const OccupationDiseasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController horizontalController = ScrollController();
    return CustomScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RoutingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
              const Icon(Icons.arrow_right),
              RoutingBarWidget(pageName: 'Meslek Hastalıkları', routeName: occupationDiseasesPageRoute),
            ],
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
                        'Meslek Hastalıkları',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Constant.sizedBoxWidth,
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
              Scrollbar(
                controller: horizontalController,
                child: SingleChildScrollView(
                  controller: horizontalController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: [
                    ['Toplam', '258', Colors.blueGrey, '-'],
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
              Constant.dividerWithIndent,
              DataTableForOccupationDiseases(
                title: 'Meslek Hastalıkları',
                columnData: const [
                  'Referans Numarası',
                  'Çalışan',
                  'Tanı',
                  'Kesin Tanı Tarihi',
                  'Departman',
                ],
              ),
              Constant.sizedBoxHeight,
              //Constant.dividerWithIndents(),
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
                      title: 'Hastalı Tanı Grupları',
                      chartData: [
                        ChartData('Tanı 1', 25),
                        ChartData('Tanı 2', 38),
                        ChartData('Tanı 3', 34),
                        ChartData('Tanı 4', 52),
                        ChartData('Tanı 5', 52),
                      ],
                    ),
                  ],
                ),
              ),
              Constant.dividerWithIndent,
            ],
          ),
        ],
      ),
    );
  }
}
