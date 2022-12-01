import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/tappable_card_widget.dart';
import 'package:aeah_work_safety/widgets/panorama_page/components/notification_card_widget.dart';
import 'package:aeah_work_safety/widgets/panorama_page/components/punishment_notification_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/panaroma/constants.dart';

class Panorama extends StatelessWidget {
  const Panorama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController horizontalController = ScrollController();
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoutingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
          Constant.divider,
          Scrollbar(
            controller: horizontalController,
            child: SingleChildScrollView(
              padding: Constant.padding,
              controller: horizontalController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  [
                    Icons.supervisor_account,
                    500,
                    'Çalışan',
                    Colors.blueGrey,
                    () {
                      Navigator.of(context).pushNamed(workersMainPageRoute);
                    }
                  ],
                  [
                    Icons.admin_panel_settings_outlined,
                    100,
                    'Kazasız Gün',
                    Colors.blueAccent.shade700,
                    () {
                      Navigator.of(context)
                          .pushNamed(dayWithoutAccidentPageRoute);
                    }
                  ],
                  [
                    Icons.add_alert_outlined,
                    10,
                    'Ramak Kala',
                    Colors.yellowAccent.shade700,
                    () {
                      Navigator.of(context).pushNamed(nearMissPageRoute);
                    }
                  ],
                  [
                    Icons.personal_injury_outlined,
                    10,
                    'İş Kazası',
                    Colors.redAccent.shade700,
                    () {
                      Navigator.of(context).pushNamed(accidentPageRoute);
                    }
                  ],
                  [
                    Icons.dangerous_outlined,
                    10,
                    'Uygunsuzluklar',
                    Colors.amberAccent.shade700,
                    () {
                      Navigator.of(context).pushNamed(inconsistenciesPageRoute);
                    }
                  ],
                  [
                    Icons.list_alt_rounded,
                    10,
                    'DÖF',
                    Colors.blueGrey.shade700,
                    () {
                      Navigator.of(context)
                          .pushNamed(preventiveActivitiesPageRoute);
                    }
                  ],
                  [
                    Icons.fact_check_outlined,
                    10,
                    'Görevler',
                    Colors.blueAccent.shade700,
                    () {
                      Navigator.of(context).pushNamed(missionsPageRoute);
                    }
                  ],
                  [
                    Icons.cast_for_education_rounded,
                    10,
                    'Eğitim',
                    Colors.yellowAccent.shade700,
                    () {
                      Navigator.of(context).pushNamed(educationPageRoute);
                    }
                  ],
                  [
                    Icons.badge,
                    10,
                    'Kronik Hastalık',
                    Colors.amberAccent.shade700,
                    () {
                      Navigator.of(context).pushNamed(chronicDiseasesPageRoute);
                    }
                  ],
                  [
                    Icons.personal_injury_outlined,
                    10,
                    'Meslek Hastalığı',
                    Colors.redAccent.shade700,
                    () {
                      Navigator.of(context)
                          .pushNamed(occupationDiseasesPageRoute);
                    }
                  ],
                  [
                    Icons.accessibility_new_sharp,
                    101,
                    'Periyodik Muayene',
                    Colors.blueAccent.shade700,
                    () {
                      Navigator.of(context)
                          .pushNamed(periodicMedicalExaminationPageRoute);
                    }
                  ]
                ]
                    .map((e) => CustomCardWidget(
                          cardIcon: e[0] as IconData,
                          cardDouble: e[1] as dynamic,
                          cardText: e[2] as String,
                          cardColor: e[3] as Color,
                          customCardWidgetOnTap: e[4] as Function()?,
                          cardSubText: 'Detay İçin Tıklayınız',
                          cardSubIcon: const Icon(Icons.arrow_right),
                        ))
                    .toList(),
              ),
            ),
          ),
          Constant.divider,
          Wrap(
            children: [
              NotificationCardWidget(
                color: Colors.redAccent.shade700,
                date: 'Bugün',
                notificationCount: 123,
                actionNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar',
                ],
                documentNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'
                ],
                educationNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar',
                ],
                workerNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'
                ],
              ),
              NotificationCardWidget(
                color: Colors.amberAccent.shade700,
                date: 'Bu Hafta',
                notificationCount: 654,
                actionNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar',
                ],
                documentNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'
                ],
                educationNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'
                ],
                workerNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'
                ],
              ),
              NotificationCardWidget(
                color: Colors.blueAccent.shade700,
                date: 'Bu Ay',
                notificationCount: 6588,
                actionNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar',
                ],
                documentNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'
                ],
                educationNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'
                ],
                workerNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'
                ],
              ),
              NotificationCardWidget(
                color: Colors.blueGrey.shade700,
                date: 'Bu Yıl',
                notificationCount: 1656,
                actionNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar',
                ],
                documentNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'
                ],
                educationNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'
                ],
                workerNotifications: const [
                  'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'
                ],
              )
            ],
          ),
          Constant.divider,
          PunishmentNotificationCardWidget(
            color: Colors.redAccent.shade700,
            title: 'Ceza Riski',
            generalNotifications: const [
              'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'
            ],
            notificationCount: '123.456.789,00 ₺',
          )
        ],
      ),
    );
  }
}
