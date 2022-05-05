import 'package:aeah_work_safety/widgets/appBar/appBar.dart';
import 'package:aeah_work_safety/widgets/components/routingBarWidget.dart';
import 'package:aeah_work_safety/widgets/homePage/components/cardWidget.dart';
import 'package:flutter/material.dart';

class WorkersPage extends StatelessWidget {
  const WorkersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          primary: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  routingBarWidget(
                      pageName: 'Panaroma', routeName: '/panaroma'),
                  Icon(Icons.arrow_right),
                  routingBarWidget(
                      pageName: 'Çalışanlar', routeName: '/panaroma/workers'),
                ],
              )
            ],
          )),
    );
  }
}
