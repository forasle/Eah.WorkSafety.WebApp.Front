import 'package:aeah_work_safety/widgets/contingency_plan_page/components/data_table_for_contingency_plans.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/contingency_plan/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/card_widget.dart';

import 'package:aeah_work_safety/blocs/mission/screens/components/search_bar.dart';

class ContingencyPlanPage extends StatelessWidget {
  const ContingencyPlanPage({Key? key}) : super(key: key);

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
              RoutingBarWidget(pageName: 'Acil Durum Planları', routeName: contingencyPlanPage),
            ],
          ),
          Constant.dividerWithIndent,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: Constant.padding8,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Acil Durum Planı',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Constant.sizedBox5W,
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
                padding: Constant.padding8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(child: ElevatedButton(onPressed: () {}, child: const Text('Rapor Yazdır'))),
                    Constant.sizedBox5W,
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
                    ['Toplam', '5', Colors.blueGrey, '-'],
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
              Padding(
                padding: Constant.padding8,
                child: Wrap(
                  children: [
                    Padding(
                      padding: Constant.padding8,
                      child: SizedBox(
                        width: 250,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(addNewContingencyPlan);
                            },
                            child: Padding(
                              padding: Constant.padding8,
                              child: Row(
                                children: const [
                                  Icon(Icons.add),
                                  Text('Yeni Acil Durum Planı Ekle'),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Constant.sizedBox5W,
                    Padding(
                      padding: Constant.padding8,
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey.shade700),
                          onPressed: () {},
                          child: Padding(
                            padding: Constant.padding8,
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
                    Constant.sizedBox5W,
                    const Padding(
                      padding: Constant.padding8,
                      child: SearchBarWidget(),
                    ),
                  ],
                ),
              ),
              Constant.dividerWithIndent,
              DataTableForContingencyPlans(
                  title: 'Acil Durum Planları',
                  columnData: const [
                    'Referans No',
                    'Ad',
                    'Tanımlayan',
                    'Oluşturma Tarihi',
                  ],
                  detailRoute: contingencyPlanDetailPage),
              Constant.sizedBox10H,
              Constant.dividerWithIndent,
            ],
          ),
        ],
      ),
    );
  }
}
