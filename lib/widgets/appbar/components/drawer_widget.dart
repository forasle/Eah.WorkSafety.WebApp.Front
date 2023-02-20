import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/appbar/constants.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 50,
      shape: Constant.drawerBorder,
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.home_filled),
            title: const Text('Panorama'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(panoramaRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text('Görevler'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(missionsPageRoute);
            },
          ),
          ExpansionTile(
            childrenPadding: Constant.drawerExpansionTileChildrenPadding,
            leading: const Icon(Icons.supervisor_account),
            title: const Text('Çalışanlar'),
            children: [
              ListTile(
                leading: const Icon(Icons.supervisor_account),
                title: const Text('Çalışanlar'),
                onTap: () {
                  Navigator.of(context).pushNamed(employeeMainPageRoute);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_add),
                title: const Text('Yeni Çalışan Ekle'),
                onTap: () {
                  Navigator.of(context).pushNamed(addNewWorker);
                },
              ),
            ],
          ),
          ExpansionTile(
            childrenPadding: Constant.drawerExpansionTileChildrenPadding,
            leading: const Icon(Icons.security),
            title: const Text('İş Güvenliği'),
            children: [
              ListTile(
                leading: const Icon(Icons.emergency_outlined),
                title: const Text('Acil Durum Planları'),
                onTap: () {
                  Navigator.of(context).pushNamed(contingencyPlanPage);
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_moderator_outlined),
                title: const Text('Risk Değerlendirme'),
                onTap: () {
                  Navigator.of(context).pushNamed(riskAssessmentPage);
                },
              ),
              ListTile(
                leading: const Icon(Icons.cast_for_education_rounded),
                title: const Text('Eğitim'),
                onTap: () {
                  Navigator.of(context).pushNamed(educationPageRoute);
                },
              ),
              ListTile(
                leading: const Icon(Icons.healing_sharp),
                title: const Text('Kazalar'),
                onTap: () {
                  Navigator.of(context).pushNamed(accidentPageRoute);
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_alert_outlined),
                title: const Text('Ramak Kala'),
                onTap: () {
                  Navigator.of(context).pushNamed(nearMissPageRoute);
                },
              ),
              ListTile(
                leading: const Icon(Icons.construction_outlined),
                title: const Text('Periyodik Kontroller'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.group_work_sharp),
                title: const Text('Ortam Ölçümleri'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.dangerous_outlined),
                title: const Text('Uygunsuzluklar'),
                onTap: () {
                  Navigator.of(context).pushNamed(inconsistenciesPageRoute);
                },
              ),
              ListTile(
                leading: const Icon(Icons.list_alt_rounded),
                title: const Text('Düzenleyici/Önleyici Faaliyetler'),
                onTap: () {
                  Navigator.of(context).pushNamed(preventiveActivitiesPageRoute);
                },
              ),
            ],
          ),
          ExpansionTile(
            childrenPadding: Constant.drawerExpansionTileChildrenPadding,
            leading: const Icon(Icons.health_and_safety_outlined),
            title: const Text('İş Sağlığı'),
            children: [
              ListTile(
                leading: const Icon(Icons.group_remove_outlined),
                title: const Text('Risk Grupları'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.playlist_play_rounded),
                title: const Text('Tetkik'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.badge),
                title: const Text('Kronik Hastalıklar'),
                onTap: () {
                  Navigator.of(context).pushNamed(chronicDiseasesPageRoute);
                },
              ),
              ListTile(
                leading: const Icon(Icons.personal_injury_outlined),
                title: const Text('Meslek Hastalıkları'),
                onTap: () {
                  Navigator.of(context).pushNamed(occupationDiseasesPageRoute);
                },
              ),
              ExpansionTile(
                childrenPadding: Constant.drawerExpansionTileChildrenPadding,
                leading: const Icon(Icons.add_alert_outlined),
                title: const Text('Muayeneler'),
                children: [
                  ListTile(
                    leading: const Icon(Icons.accessibility_new_sharp),
                    title: const Text('İşe Giriş/Periyodik Muayene'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.replay_circle_filled_rounded),
                    title: const Text('İşe Dönüş Muayene'),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            childrenPadding: Constant.drawerExpansionTileChildrenPadding,
            leading: const Icon(Icons.date_range_outlined),
            title: const Text('Takvim & Yıllık Planlar'),
            children: [
              ListTile(
                leading: const Icon(Icons.playlist_add_check),
                title: const Text('Yıllık Çalışma Planı'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.cast_for_education_rounded),
                title: const Text('Tesis Eğitim Planı'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.home_work_rounded),
                title: const Text('Tesis İzleme Planı'),
                onTap: () {},
              ),
            ],
          ),
          ExpansionTile(
            childrenPadding: Constant.drawerExpansionTileChildrenPadding,
            leading: const Icon(Icons.settings),
            title: const Text('Ayarlar'),
            children: [
              ListTile(
                leading: const Icon(Icons.person_pin),
                title: const Text('Profil'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.safety_divider_outlined),
                title: const Text('Kullancılar'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Yardım'),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
