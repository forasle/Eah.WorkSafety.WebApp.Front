import 'package:aeah_work_safety/blocs/user/screens/components/notification_card_widget.dart';
import 'package:aeah_work_safety/blocs/user/screens/components/punishment_notification_card_widget.dart';
import 'package:aeah_work_safety/blocs/user/user_bloc.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/tappable_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/panaroma/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aeah_work_safety/blocs/user/models/user_request.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

class Panorama extends StatelessWidget {
  const Panorama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController horizontalController = ScrollController();
    context.watch<UserBloc>().add(GetUserData(userRequest: UserRequest()));
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserData) {
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
                    child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            [
                              Icons.supervisor_account,
                              state is UserData ? state.statisticResponse.numberOfEmployee : '-',
                              'Çalışan',
                              Colors.blueGrey,
                              () {
                                Navigator.of(context).pushNamed(employeeMainPageRoute);
                              }
                            ],
                            [
                              Icons.admin_panel_settings_outlined,
                              state is UserData ? state.statisticResponse.dayWithoutAccident : '-',
                              'Kazasız Gün',
                              Colors.blueAccent.shade700,
                              () {
                                Navigator.of(context).pushNamed(dayWithoutAccidentPageRoute);
                              }
                            ],
                            [
                              Icons.add_alert_outlined,
                              state is UserData ? state.statisticResponse.numberOfNearMisses : '-',
                              'Ramak Kala',
                              Colors.yellowAccent.shade700,
                              () {
                                Navigator.of(context).pushNamed(nearMissPageRoute);
                              }
                            ],
                            [
                              Icons.personal_injury_outlined,
                              state is UserData ? state.statisticResponse.numberOfAccidents : '-',
                              'İş Kazası',
                              Colors.redAccent.shade700,
                              () {
                                Navigator.of(context).pushNamed(accidentPageRoute);
                              }
                            ],
                            [
                              Icons.dangerous_outlined,
                              state is UserData ? state.statisticResponse.numberOfInconsistencies : '-',
                              'Uygunsuzluklar',
                              Colors.amberAccent.shade700,
                              () {
                                Navigator.of(context).pushNamed(inconsistenciesPageRoute);
                              }
                            ],
                            [
                              Icons.list_alt_rounded,
                              state is UserData ? state.statisticResponse.numberOfPreventiveActivities : '-',
                              'DÖF',
                              Colors.blueGrey.shade700,
                              () {
                                Navigator.of(context).pushNamed(preventiveActivitiesPageRoute);
                              }
                            ],
                            [
                              Icons.fact_check_outlined,
                              state is UserData ? state.userResponse.userAddedMissions.length : '-',
                              'Görevler',
                              Colors.blueAccent.shade700,
                              () {
                                Navigator.of(context).pushNamed(missionsPageRoute);
                              }
                            ],
                            /*[
                              Icons.cast_for_education_rounded,
                              '-',
                              'Eğitim',
                              Colors.yellowAccent.shade700,
                              () {
                                Navigator.of(context).pushNamed(educationPageRoute);
                              }
                            ],*/
                            [
                              Icons.badge,
                              state is UserData ? state.statisticResponse.numberOfChronicDisease : '-',
                              'Kronik Hastalık',
                              Colors.amberAccent.shade700,
                              () {
                                Navigator.of(context).pushNamed(chronicDiseasesPageRoute);
                              }
                            ],
                            [
                              Icons.personal_injury_outlined,
                              state is UserData ? state.statisticResponse
                                  .numberOfOccupationDisease: '-',
                              'Meslek Hastalığı',
                              Colors.redAccent.shade700,
                              () {
                                Navigator.of(context).pushNamed(occupationDiseasesPageRoute);
                              }
                            ],
                            /*[
                              Icons.accessibility_new_sharp,
                              '-',
                              'Periyodik Muayene',
                              Colors.blueAccent.shade700,
                              () {
                                Navigator.of(context).pushNamed(periodicMedicalExaminationPageRoute);
                              }
                            ]*/
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
                        );
                      },
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
                      documentNotifications: const ['Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'],
                      workerNotifications: const ['Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'],
                    ),
                    NotificationCardWidget(
                      color: Colors.amberAccent.shade700,
                      date: 'Bu Hafta',
                      notificationCount: 654,
                      actionNotifications: const [
                        'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar',
                      ],
                      documentNotifications: const ['Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'],
                      workerNotifications: const ['Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'],
                    ),
                    NotificationCardWidget(
                      color: Colors.blueAccent.shade700,
                      date: 'Bu Ay',
                      notificationCount: 6588,
                      actionNotifications: const [
                        'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar',
                      ],
                      documentNotifications: const ['Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'],
                      workerNotifications: const ['Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'],
                    ),
                    NotificationCardWidget(
                      color: Colors.blueGrey.shade700,
                      date: 'Bu Yıl',
                      notificationCount: 1656,
                      actionNotifications: const [
                        'Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar',
                      ],
                      documentNotifications: const ['Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'],
                      workerNotifications: const ['Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'],
                    )
                  ],
                ),
                Constant.divider,
                PunishmentNotificationCardWidget(
                  color: Colors.redAccent.shade700,
                  title: 'Ceza Riski',
                  generalNotifications: const ['Sağlık Konuları eğitimi verilmemiş yada süresi geçmiş çalışanlar'],
                  notificationCount: '123.456.789,00 ₺',
                )
              ],
            ),
          );
        } else {
          return ErrorWidget("Veriler getirilemedi");
        }
      },
    );
  }
}
