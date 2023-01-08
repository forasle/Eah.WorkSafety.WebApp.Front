import 'package:aeah_work_safety/widgets/education_page/components/data_table_for_education.dart';
import 'package:aeah_work_safety/blocs/accident/screens/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/education/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/card_widget.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({Key? key}) : super(key: key);

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
              RoutingBarWidget(pageName: 'Eğitim', routeName: educationPageRoute),
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
                        'Eğitim',
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
                    ['Toplam Sertifika', '5984', Colors.blueGrey, '-'],
                    ['Toplam Zorunlu Sertifika', '2545', Colors.blueGrey.shade700, '-'],
                    ['Eğitim Verilen Kişi', '1240', Colors.blueAccent.shade700, '-'],
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
                padding: Constant.padding,
                child: Wrap(
                  children: [
                    Padding(
                      padding: Constant.padding,
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, addNewEducation);
                          },
                          child: Padding(
                            padding: Constant.padding,
                            child: Row(
                              children: const [
                                Icon(Icons.add),
                                Text('Yeni Eğitim'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Constant.sizedBoxWidth,
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
                                  Icon(Icons.download_rounded),
                                  Text('Eğitim Yükle'),
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
                    const Padding(
                      padding: Constant.padding,
                      child: SearchBarWidget(),
                    ),
                  ],
                ),
              ),
              Constant.dividerWithIndent,
              DataTableForEducation(
                title: 'Eğitim',
                columnData: const [
                  'Ad',
                  'Tarih',
                  'Eğitimci',
                  'Süre',
                  'Durum',
                ],
                detailRoute: addNewEducation,
              ),
              Constant.sizedBoxHeight,
              Constant.dividerWithIndent,
            ],
          ),
        ],
      ),
    );
  }
}
