import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/widgets/appBar/appBar.dart';
import 'package:aeah_work_safety/widgets/components/routingBarWidget.dart';
import 'package:aeah_work_safety/widgets/components/cardWidget.dart';
import 'package:aeah_work_safety/widgets/workersPage/components/dataTableWidget.dart';
import 'package:flutter/material.dart';

class WorkersPage extends StatelessWidget {
  const WorkersPage({Key? key}) : super(key: key);

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
              routingBarWidget(pageName: 'Panaroma', routeName: '/panaroma'),
              Icon(Icons.arrow_right),
              routingBarWidget(
                  pageName: 'Çalışanlar', routeName: '/panaroma/workers'),
            ],
          ),
          Divider(
            indent: 50,
            endIndent: 50,
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
                      customCardWidgetOnTap: () {},
                      cardSubText: '-'),
                  CustomCardWidget(
                      cardSubIcon: Icon(null),
                      cardIcon: Icons.account_tree_rounded,
                      cardText: 'Ortalama Yaş',
                      cardDouble: 29,
                      cardColor: Colors.amberAccent.shade700,
                      customCardWidgetOnTap: () {},
                      cardSubText: '-'),
                  CustomCardWidget(
                      cardSubIcon: Icon(null),
                      cardIcon: Icons.access_time_outlined,
                      cardText: 'Ortalama Çalışma Süresi',
                      cardDouble: 500,
                      cardColor: Colors.orangeAccent.shade700,
                      customCardWidgetOnTap: () {},
                      cardSubText: '-'),
                ],
              ),
            ),
          ),
          Divider(
            indent: 50,
            endIndent: 50,
          ),
          DataTableDemo(),
        ],
      ),
    );
  }
}
