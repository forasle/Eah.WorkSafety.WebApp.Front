import 'package:aeah_work_safety/blocs/chronic_disease/screens/components/chronic_disease_list_view.dart';
import 'package:aeah_work_safety/blocs/statistic/statistic_bloc.dart';
import 'package:aeah_work_safety/widgets/components/circular_graph.dart';
import 'package:aeah_work_safety/widgets/components/column_graph.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/chronic_disease/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../mission/screens/components/search_bar.dart';

class ChronicDisease extends StatelessWidget {
  const ChronicDisease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController horizontalController = ScrollController();
    context.read<StatisticBloc>().add(const GetStatisticData());
    return CustomScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RoutingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
              const Icon(Icons.arrow_right),
              RoutingBarWidget(pageName: 'Kronik Hastalık', routeName: chronicDiseasesPageRoute),
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
                        'Kronik Hastalık',
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
                  ],
                ),
              ),
              Scrollbar(
                controller: horizontalController,
                child: SingleChildScrollView(
                  controller: horizontalController,
                  scrollDirection: Axis.horizontal,
                  child: BlocBuilder<StatisticBloc, StatisticState>(
                    builder: (context, state) {
                      return Row(
                          children: [
                        [
                          'Kronik Hast. Çalışan',
                          state is StatisticLoaded
                              ? (state.statisticResponse.numberOfAccidents + state.statisticResponse.numberOfChronicDisease)
                                  .toString()
                              : "-",
                          Colors.blueGrey,
                          '-'
                        ],
                        [
                          'Kronik Hast. Çalışan Yüzdesi',
                          '-',
                          Colors.blueGrey.shade700,
                          'KRONIK HASTALIKLI ÇALIŞAN / TOPLAM ÇALIŞAN * 100'
                        ],
                        ['Ort. Çalışma Süresi (Yıl)', '-', Colors.blueAccent.shade700, '-'],
                        ['Ortalama Yaş',                           state is StatisticLoaded
                      ? (state.statisticResponse.numberOfAccidents + state.statisticResponse.averageAgeOfEmployee)
                          .toString()
                          : "-", Colors.greenAccent.shade700, '-'],
                      ]
                              .map(
                                (e) => CardWidget(
                                    cardText: e[0] as String,
                                    cardDouble: e[1] as String,
                                    cardColor: e[2] as Color,
                                    cardSubText: e[3] as String),
                              )
                              .toList());
                    },
                  ),
                ),
              ),
              Constant.dividerWithIndent,
              SizedBox(width: MediaQuery.of(context).size.width - 15, height: 500, child: const ChronicDiseaseListView()),
              Constant.sizedBoxHeight,
              //dividerWithIndents(),
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
              Constant.dividerWithIndent,
            ],
          ),
        ],
      ),
    );
  }
}
