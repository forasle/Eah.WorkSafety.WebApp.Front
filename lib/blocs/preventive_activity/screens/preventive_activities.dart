
import 'package:aeah_work_safety/blocs/preventive_activity/screens/components/preventive_activity_list_view.dart';
import 'package:aeah_work_safety/blocs/statistic/statistic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/preventive_activities/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreventiveActivities extends StatelessWidget {
  const PreventiveActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<StatisticBloc>().add(const GetStatisticData());
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
              RoutingBarWidget(pageName: 'Düzenleyici Önleyici Faaliyetler', routeName: preventiveActivitiesPageRoute),
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
                        'Düzenleyici Önleyici Faaliyetler',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Constant.sizedBox10W,
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
                    Constant.sizedBox10W,
                  ],
                ),
              ),
              Scrollbar(
                controller: horizontalController,
                child: BlocBuilder<StatisticBloc, StatisticState>(
                  builder: (context, state) {
                    return SingleChildScrollView(
                      controller: horizontalController,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: [
                        [
                          'Ortalama Yaş(Gün)',
                          state is StatisticLoaded
                              ? (state.statisticResponse.numberOfAccidents + state.statisticResponse.numberOfNearMisses)
                                  .toString()
                              : "-",
                          Colors.blueGrey,
                          '-'
                        ],
                        ['Açık DÖF\'ler', '-', Colors.yellowAccent.shade700, '-'],
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
                    );
                  },
                ),
              ),
              Constant.dividerWithIndent,
              Padding(
                padding: Constant.padding,
                child: Wrap(
                  children: [
                    Padding(
                      padding: Constant.padding,
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, addNewPreventiveActivity);
                            },
                            child: Padding(
                              padding: Constant.padding,
                              child: Row(
                                children: const [
                                  Icon(Icons.add),
                                  Text('Yeni DÖF'),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Constant.sizedBox10W,
                    Padding(
                      padding: Constant.padding,
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent.shade700),
                            onPressed: () {},
                            child: Padding(
                              padding: Constant.padding,
                              child: Row(
                                children: const [
                                  Icon(Icons.upload_rounded),
                                  Text('DÖF Yükle'),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Constant.sizedBox10W,
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
                    Constant.sizedBox10W,
                  ],
                ),
              ),
              Constant.dividerWithIndent,
              SizedBox(width: MediaQuery.of(context).size.width - 15, height: 500, child: const PreventiveActivityListView()),
              Constant.sizedBox10H,
              Constant.dividerWithIndent,
            ],
          ),
        ],
      ),
    );
  }
}
