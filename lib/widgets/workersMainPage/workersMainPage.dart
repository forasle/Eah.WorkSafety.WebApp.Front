import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/appBar.dart';
import 'package:aeah_work_safety/widgets/components/routingBarWidget.dart';
import 'package:aeah_work_safety/widgets/components/cardWidget.dart';
import 'package:aeah_work_safety/widgets/workAccidentPage/components/searchBar.dart';
import 'package:aeah_work_safety/widgets/workersMainPage/components/dataTableWidget.dart';
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
          Divider(
            indent: 50,
            endIndent: 50,
          ),
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
          Divider(
            indent: 50,
            endIndent: 50,
          ),
          DataTableForUser(),
        ],
      ),
    );
  }
}
