import 'package:aeah_work_safety/widgets/preventive_activities_page/components/data_table_for_preventive_activities.dart';
import 'package:aeah_work_safety/widgets/workAccidentPage/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/card_widget.dart';

class PreventiveActivities extends StatelessWidget {
  const PreventiveActivities({Key? key}) : super(key: key);

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
                  pageName: 'Düzenleyici Önleyici Faaliyetler',
                  routeName: dayWithoutAccidentPageRoute),
            ],
          ),
          dividerWithIndents(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Düzenleyici Önleyici Faaliyetler',
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
              Scrollbar(
                controller: horizantalController,
                child: SingleChildScrollView(
                  controller: horizantalController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: [
                    ['Ortalama Yaş(Gün)', '5', Colors.blueGrey, '-'],
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
                ),
              ),
              dividerWithIndents(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.add),
                                  Text('Yeni DÖF'),
                                ],
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.greenAccent.shade700),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.download_rounded),
                                  Text('DÖF Yükle'),
                                ],
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey.shade700),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.access_alarm_rounded),
                                Text('Detaylı Excel'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SearchBarWidget(),
                    ),
                  ],
                ),
              ),
              dividerWithIndents(),
              DataTableForPreventiveActivities(
                title: 'Düzenleyici Önleyici Faaliyetler',
                columnData: const [
                  'Referans No',
                  'Ad',
                  'Durum',
                  'Sorumlu',
                  'İlişki',
                  'Termin Tarihi',
                  'Süpervizör',
                  'Açıklama',
                  'Rapor Eden',
                  'Oluşturulma Tarihi',
                  'Kök Neden Analizi Gerekiyor Mu'
                ],
              ),
              SizedBox(
                height: 10,
              ),
              dividerWithIndents(),
            ],
          ),
        ],
      ),
    );
  }
}
