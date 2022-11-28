import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/tappable_card_widget.dart';
import 'package:aeah_work_safety/widgets/components/circular_graph.dart';
import 'package:aeah_work_safety/widgets/components/column_graph.dart';
import 'package:aeah_work_safety/widgets/workAccidentPage/components/search_bar.dart';
import 'package:aeah_work_safety/widgets/workersMainPage/components/data_table_for_user.dart';
import 'package:flutter/material.dart';

class WorkersMainPage extends StatelessWidget {
  const WorkersMainPage({Key? key}) : super(key: key);

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
                  pageName: 'Çalışanlar', routeName: workersMainPageRoute),
            ],
          ),
          Constant.dividerWithIndents(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Çalışanlar',
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
            ],
          ),
          Scrollbar(
            controller: horizantalController,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(5),
              controller: horizantalController,
              scrollDirection: Axis.horizontal,
              primary: false,
              child: Row(
                children: [
                  CustomCardWidget(
                      cardSubIcon: Icon(null),
                      cardIcon: Icons.supervisor_account,
                      cardText: 'Toplam Çalışan',
                      cardDouble: 500,
                      cardColor: Colors.blueGrey,
                      customCardWidgetOnTap: null,
                      cardSubText: '-'),
                  CustomCardWidget(
                      cardSubIcon: Icon(null),
                      cardIcon: Icons.account_tree_rounded,
                      cardText: 'Ortalama Yaş',
                      cardDouble: 29,
                      cardColor: Colors.amberAccent.shade700,
                      customCardWidgetOnTap: null,
                      cardSubText: '-'),
                  CustomCardWidget(
                      cardSubIcon: Icon(null),
                      cardIcon: Icons.access_time_outlined,
                      cardText: 'Ortalama Çalışma Süresi',
                      cardDouble: 500,
                      cardColor: Colors.orangeAccent.shade700,
                      customCardWidgetOnTap: null,
                      cardSubText: '-'),
                ],
              ),
            ),
          ),
          Constant.dividerWithIndents(),
          DataTableForUser(),
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
                  title: 'Yaş Dağılımı',
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
                  title: 'Departmanlar',
                  chartData: [
                    ChartData('David', 25),
                    ChartData('Steve', 38),
                    ChartData('Jack', 34),
                    ChartData('Others', 52),
                  ],
                ),
                CircularGraph(
                  title: 'Cinsiyet Dağılımı',
                  chartData: [
                    ChartData('David', 25),
                    ChartData('Steve', 38),
                    ChartData('Jack', 34),
                  ],
                ),
                CircularGraph(
                  title: 'Kan Grubu',
                  chartData: [
                    ChartData('David', 25),
                    ChartData('Steve', 38),
                  ],
                ),
                ColumnGraph(
                  title: 'İşe Giriş Tarihi',
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
