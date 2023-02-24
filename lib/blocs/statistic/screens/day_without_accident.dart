import 'package:aeah_work_safety/blocs/statistic/statistic_bloc.dart';
import 'package:aeah_work_safety/widgets/components/circular_graph.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/accident/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DayWithoutAccidentPage extends StatelessWidget {
  const DayWithoutAccidentPage({Key? key}) : super(key: key);

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
              RoutingBarWidget(pageName: 'Kazasız Geçen Gün', routeName: dayWithoutAccidentPageRoute),
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
                        'Kazasız Geçen Gün',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Constant.sizedBox,
                    Flexible(
                      child: Text(
                        '(Yetki seviyenize göre görüntüleyebildiğiniz liste & raporlar)',
                        style: Theme.of(context).textTheme.labelSmall,
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
                          'Kazasız geçen gün',
                          state is StatisticLoaded ? state.statisticResponse.dayWithoutAccident.toString() : "-",
                          Colors.blueGrey,
                          'SON IŞ KAZASI ÜZERINDEN GEÇEN ZAMAN'
                        ],
                        [
                          'Toplam kayıp gün',
                          state is StatisticLoaded ? state.statisticResponse.totalLostDays.toString() : "-",
                          Colors.yellowAccent.shade700,
                          '-'
                        ],
                        [
                          'Kaza Geçiren Çalışan',
                          state is StatisticLoaded ? state.statisticResponse.numberOfEmployeeWhoHadAnAccident.toString() : "-",
                          Colors.blueAccent.shade700,
                          '-'
                        ],
                        ['Kaza Sıklık Oranı',

                          state is StatisticLoaded ? ((state.statisticResponse.numberOfAccidents+state.statisticResponse.numberOfNearMisses)*1000000/(state.statisticResponse.numberOfEmployee*8)).toString() : "-",

                          Colors.orangeAccent.shade700, 'TOPLAM KAZA X 1M / YILLIK ADAM SAAT'],
                        [
                          'Kaza Ağırlık Oranı',
                          state is StatisticLoaded ? ((state.statisticResponse.numberOfLostDays)*1000000/(state.statisticResponse.numberOfEmployee*8)).toString() : "-",
                          Colors.blueGrey.shade700,
                          'TOPLAM KAYIP GÜN X 1M / YILLIK ADAM SAAT'
                        ],
                        [
                          'Kayıp Günlü Kaza Sıklık Oranı',
                          state is StatisticLoaded ? ((state.statisticResponse.numberOfAccidentWhichHasGotLostDay)*1000000/(state.statisticResponse.numberOfEmployee*8)).toString() : "-",
                          Colors.yellowAccent.shade700,
                          'KAYIP GÜNLÜ KAZA X 1M / YILLIK ADAM SAAT'
                        ],
                        [
                          'İlkyardım Gerekirtiren Kaza Sıklık Oranı',
                          state is StatisticLoaded ? ((state.statisticResponse.numberOfAccidentWhichNeedsFirstAid)*1000000/(state.statisticResponse.numberOfEmployee*8)).toString() : "-",
                          Colors.lightBlueAccent.shade700,
                          'İLKYARDIM GEREKTIREN KAZA X 1M/YILLIK ADAM SAAT'
                        ],
                        [
                          'Kaza Ağırlık Oranı',
                          state is StatisticLoaded ? ((state.statisticResponse.totalLostDays)*1000000/(state.statisticResponse.numberOfEmployee*8)).toString() : "-",
                          Colors.blueGrey.shade700,
                          'TOPLAM KAYIP GÜN X 1M / YILLIK ADAM SAAT'
                        ],
                        [
                          'Kayıp Günlü Kaza Sıklık Oranı',
                          state is StatisticLoaded ? ((state.statisticResponse.numberOfAccidents+state.statisticResponse.numberOfNearMisses)*200000/(state.statisticResponse.numberOfEmployee*8)).toString() : "-",
                          Colors.orangeAccent.shade700,
                          'KAYIP GÜNLÜ KAZA X 200,000 / YILLIK ADAM SAAT'
                        ],
                        [
                          'Kaza Ağırlık Oranı',
                          state is StatisticLoaded ? ((state.statisticResponse.numberOfLostDays)*200000/(state.statisticResponse.numberOfEmployee*8)).toString() : "-",
                          Colors.green.shade700,
                          'TOPLAM KAYIP GÜN X 200,000 / YILLIK ADAM SAAT'
                        ],
                        [
                          'İlkyardım Gerekirtiren Kaza Sıklık Oranı',
                          state is StatisticLoaded ? ((state.statisticResponse.numberOfAccidentWhichNeedsFirstAid)*200000/(state.statisticResponse.numberOfEmployee*8)).toString() : "-",
                          Colors.blueGrey.shade700,
                          'İLKYARDIM GEREKTIREN KAZA X 200,000/YILLIK ADAM SAAT'
                        ],
                        ['Şiddet(Severity) Oranı', '-', Colors.green.shade700, 'KAYIP GÜN / KAYIP GÜNLÜ KAZA'],
                        ['Toplam Olay',
                          state is StatisticLoaded ? (state.statisticResponse.numberOfAccidents+state.statisticResponse.numberOfNearMisses).toString() : "-",
                          Colors.amberAccent.shade700, 'TOPLAM RAMAK KALA + İŞ KAZASI'],
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
                child: Text(
                  'Rapor',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Constant.dividerWithIndent,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BlocBuilder<StatisticBloc, StatisticState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        if (state is StatisticLoaded)
                          CircularGraph(
                            title: 'Kaza/Ramak Kala',
                            chartData: [
                              ChartData('Kaza', state.statisticResponse.numberOfAccidents.toDouble()),
                              ChartData('Ramak Kala', state.statisticResponse.numberOfNearMisses.toDouble()),
                            ],
                          ),
                        if (state is StatisticLoaded)
                        CircularGraph(
                          title: 'Kök Neden Gereksinimi',
                          chartData: [
                            ChartData('Gerekiyor', state.statisticResponse.numberOfRootCauseAnalysisRequirementForAccident.toDouble()),
                            ChartData('Gerekmiyor', (state.statisticResponse.numberOfAccidents-state.statisticResponse.numberOfRootCauseAnalysisRequirementForAccident).toDouble()),
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
