import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text('Panorama'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(panaromaRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Görevler'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(missionsRoute);
            },
          ),
          ExpansionTile(
            childrenPadding: EdgeInsets.only(left: 35),
            leading: Icon(Icons.supervisor_account),
            title: Text('Çalışanlar'),
            children: [
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text('Çalışanlar'),
                onTap: () {
                  Navigator.of(context).pushNamed(workersMainPageRoute);
                },
              ),
              ListTile(
                leading: Icon(Icons.person_add),
                title: Text('Yeni Çalışan Ekle'),
                onTap: () {},
              ),
            ],
          ),
          ExpansionTile(
            childrenPadding: EdgeInsets.only(left: 35),
            leading: Icon(Icons.security),
            title: Text('İş Güvenliği'),
            children: [
              ListTile(
                leading: Icon(Icons.emergency_outlined),
                title: Text('Acil Durum Planları'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.add_moderator_outlined),
                title: Text('Risk Değerlendirme'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.cast_for_education_rounded),
                title: Text('Eğitim'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.healing_sharp),
                title: Text('Kazalar'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.add_alert_outlined),
                title: Text('Ramak Kalalar'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.construction_outlined),
                title: Text('Periyodik Kontroller'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.group_work_sharp),
                title: Text('Ortam Ölçümleri'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.dangerous_outlined),
                title: Text('Uygunsuzluklar'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.list_alt_rounded),
                title: Text('Düzenleyici/Önleyici Faaliyetler'),
                onTap: () {},
              ),
            ],
          ),
          ExpansionTile(
            childrenPadding: EdgeInsets.only(left: 35),
            leading: Icon(Icons.health_and_safety_outlined),
            title: Text('İş Sağlığı'),
            children: [
              ListTile(
                leading: Icon(Icons.group_remove_outlined),
                title: Text('Risk Grupları'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.playlist_play_rounded),
                title: Text('Tetkik'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.badge),
                title: Text('Kronik Hastalıklar'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.personal_injury_outlined),
                title: Text('Meslek Hastalıkları'),
                onTap: () {},
              ),
              ExpansionTile(
                childrenPadding: EdgeInsets.only(left: 35),
                leading: Icon(Icons.add_alert_outlined),
                title: Text('Muayeneler'),
                children: [
                  ListTile(
                    leading: Icon(Icons.accessibility_new_sharp),
                    title: Text('İşe Giriş/Periyodik Muayene'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.replay_circle_filled_rounded),
                    title: Text('İşe Dönüş Muayene'),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            childrenPadding: EdgeInsets.only(left: 35),
            leading: Icon(Icons.date_range_outlined),
            title: Text('Takvim & Yıllık Planlar'),
            children: [
              ListTile(
                leading: Icon(Icons.playlist_add_check),
                title: Text('Yıllık Çalışma Planı'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.cast_for_education_rounded),
                title: Text('Tesis Eğitim Planı'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.home_work_rounded),
                title: Text('Tesis İzleme Planı'),
                onTap: () {},
              ),
            ],
          ),
          ExpansionTile(
            childrenPadding: EdgeInsets.only(left: 35),
            leading: Icon(Icons.settings),
            title: Text('Ayarlar'),
            children: [
              ListTile(
                leading: Icon(Icons.person_pin),
                title: Text('Profil'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.safety_divider_outlined),
                title: Text('Kullancılar'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Yardım'),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
