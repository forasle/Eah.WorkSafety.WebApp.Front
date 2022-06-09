import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/test.dart';
import 'package:aeah_work_safety/widgets/chronic_diseases_page/chronic_diseases_page.dart';
import 'package:aeah_work_safety/widgets/components/add_new_work_accident.dart';
import 'package:aeah_work_safety/widgets/dayWithoutAccidentPage/day_without_accident.dart';
import 'package:aeah_work_safety/widgets/education_page/education_page.dart';
import 'package:aeah_work_safety/widgets/home_page/panaroma.dart';
import 'package:aeah_work_safety/widgets/inconsistencies_page/inconsistencies_page.dart';
import 'package:aeah_work_safety/widgets/loginPage/login.dart';
import 'package:aeah_work_safety/widgets/missionsPage/missions.dart';
import 'package:aeah_work_safety/widgets/near_miss_page/near_miss.dart';
import 'package:aeah_work_safety/widgets/occupational_diseases_page/occupational_diseases_page.dart';
import 'package:aeah_work_safety/widgets/periodic_medical_examination_page/periodic_medical_examination_page.dart';
import 'package:aeah_work_safety/widgets/preventive_activities_page/preventive_activities_page.dart';
import 'package:aeah_work_safety/widgets/workAccidentPage/work_accident.dart';
import 'package:aeah_work_safety/widgets/workersDetailPage/workers_detail_page.dart';
import 'package:aeah_work_safety/widgets/workersMainPage/workers_main_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        loginRoute: (context) => const Login(),
        panaromaRoute: (context) => const Panaroma(),
        missionsPageRoute: (context) => const Missions(),
        workersMainPageRoute: (context) => const WorkersMainPage(),
        workersDetailPageRoute: (context) => const WorkersDetailPage(),
        dayWithoutAccidentPageRoute: (context) =>
            const DayWithoutAccidentPage(),
        workAccidentPageRoute: (context) => const WorkAccidentPage(),
        nearMissPageRoute: (context) => const NearMissPage(),
        inconsistenciesPageRoute: (context) => const InconsistenciesPage(),
        preventiveActivitiesPageRoute: (context) =>
            const PreventiveActivities(),
        educationPageRoute: (context) => const EducationPage(),
        chronicDiseasesPageRoute: (context) => const ChronicDiseasesPage(),
        occupationDiseasesPageRoute: (context) =>
            const OccupationDiseasesPage(),
        periodicMedicalExaminationPageRoute: (context) =>
            const PeriodicMedicalExaminationPage(),
        testPageRoute: (context) => const Test(),
        addNewWorkAccident: (context) => const AddNewWorkAccident(),
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
