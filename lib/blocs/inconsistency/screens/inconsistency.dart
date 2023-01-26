import 'package:aeah_work_safety/blocs/inconsistency/screens/components/inconsistency_list_view.dart';
import 'package:aeah_work_safety/blocs/statistic/statistic_bloc.dart';
import 'package:aeah_work_safety/widgets/components/circular_graph.dart';
import 'package:aeah_work_safety/blocs/mission/screens/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/inconsistency/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/data_table_for_inconsistency.dart';

class Inconsistency extends StatelessWidget {
  const Inconsistency({Key? key}) : super(key: key);

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
              RoutingBarWidget(pageName: 'Uygunsuzluklar', routeName: dayWithoutAccidentPageRoute),
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
                        'Uygunsuzluklar',
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
                          'Toplam Uygunsuzluk',
                          state is StatisticLoaded ? state.statisticResponse.numberOfInconsistencies.toString() : '-',
                          Colors.blueGrey,
                          '-'
                        ],
                        //['Ortalama Yaş(Gün)', '-', Colors.yellowAccent.shade700, '-'],
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
                              .toList());
                    },
                  ),
                ),
              ),
              Constant.dividerWithIndent,
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
                                children: const [
                                  Icon(Icons.add),
                                  Text('Yeni Saha Denetimi'),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Constant.sizedBoxWidth,
                    Padding(
                      padding: Constant.padding,
                      child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent.shade700),
                            onPressed: () {
                              Navigator.pushNamed(context, addNewInconsistencies);
                            },
                            child: Padding(
                              padding: Constant.padding,
                              child: Row(
                                children: const [
                                  Icon(Icons.download_rounded),
                                  Text('Yeni Uygunsuzluk'),
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
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey.shade700),
                          onPressed: () {},
                          child: Padding(
                            padding: Constant.padding,
                            child: Row(
                              children: const [
                                Icon(Icons.access_alarm_rounded),
                                Text('Detaylı Excel'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Constant.sizedBoxWidth,
                  ],
                ),
              ),
              Constant.dividerWithIndent,
              SizedBox(
                  width: MediaQuery.of(context).size.width - 15, height: 500, child: const InconsistencyListView()),
              Constant.sizedBoxHeight,
              Constant.dividerWithIndent,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BlocBuilder<StatisticBloc, StatisticState>(
                  builder: (context, state) {
                    return Row(
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
                    );
                  },
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
