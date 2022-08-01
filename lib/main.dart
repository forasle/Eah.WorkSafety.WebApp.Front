import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/chronic_diseases_page/chronic_diseases_page.dart';
import 'package:aeah_work_safety/widgets/components/add_new_worker.dart';
import 'package:aeah_work_safety/widgets/contingency_plans_page/components/add_new_contingency_plan.dart';
import 'package:aeah_work_safety/widgets/contingency_plans_page/components/contingency_plans_detail_page.dart';
import 'package:aeah_work_safety/widgets/contingency_plans_page/contingency_plans.dart';
import 'package:aeah_work_safety/widgets/education_page/components/add_new_education.dart';
import 'package:aeah_work_safety/widgets/inconsistencies_page/components/add_new_inconsistencies.dart';
import 'package:aeah_work_safety/widgets/components/add_new_work_accident_or_near_miss.dart';
import 'package:aeah_work_safety/widgets/dayWithoutAccidentPage/day_without_accident.dart';
import 'package:aeah_work_safety/widgets/education_page/education_page.dart';
import 'package:aeah_work_safety/widgets/home_page/panaroma.dart';
import 'package:aeah_work_safety/widgets/inconsistencies_page/components/inconsistencies_detail_page.dart';
import 'package:aeah_work_safety/widgets/inconsistencies_page/inconsistencies_page.dart';
import 'package:aeah_work_safety/widgets/loginPage/login.dart';
import 'package:aeah_work_safety/widgets/missionsPage/missions.dart';
import 'package:aeah_work_safety/widgets/near_miss_page/components/near_miss_detail_page.dart';
import 'package:aeah_work_safety/widgets/near_miss_page/near_miss.dart';
import 'package:aeah_work_safety/widgets/occupational_diseases_page/occupational_diseases_page.dart';
import 'package:aeah_work_safety/widgets/periodic_medical_examination_page/periodic_medical_examination_page.dart';
import 'package:aeah_work_safety/widgets/preventive_activities_page/components/add_new_preventive_activity.dart';
import 'package:aeah_work_safety/widgets/preventive_activities_page/components/preventive_activity_detail_page.dart';
import 'package:aeah_work_safety/widgets/preventive_activities_page/preventive_activities_page.dart';
import 'package:aeah_work_safety/widgets/risk_assessment/components/add_new_risk_assessment.dart';
import 'package:aeah_work_safety/widgets/risk_assessment/components/risk_assessment_detail_page.dart';
import 'package:aeah_work_safety/widgets/risk_assessment/risk_assessment_page.dart';
import 'package:aeah_work_safety/widgets/workAccidentPage/components/work_accident_detail_page.dart';
import 'package:aeah_work_safety/widgets/workAccidentPage/work_accident.dart';
import 'package:aeah_work_safety/widgets/workersDetailPage/workers_detail_page.dart';
import 'package:aeah_work_safety/widgets/workersMainPage/workers_main_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('en'), Locale('tr')],
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
        addNewWorkAccidentOrNearMiss: (context) =>
            const AddNewWorkAccidentOrNearMiss(),
        addNewInconsistencies: (context) => const AddNewInconsistencies(),
        nearMissDetailPage: (context) => const NearMissDetailPage(),
        workAccidentDetailPage: (context) => const WorkAccidentDetailPage(),
        inconsistenciesDetailPage: (context) =>
            const InconsistenciesDetailPage(),
        addNewPreventiveActivity: (context) => const AddNewPreventiveActivity(),
        preventiveActivityDetailPage: (context) =>
            const PreventiveActivityDetailPage(),
        addNewEducation: (context) => const AddNewEducation(),
        contingencyPlansPage: (context) => const ContingencyPlansPage(),
        addNewContingencyPlan: (context) => const AddNewContingencyPlan(),
        contingencyPlansDetailPage: (context) =>
            const ContingencyPlanDetailPage(),
        addNewWorker: (context) => const AddNewWorker(),
        riskAssessmentPage: (context) => const RiskAssessmentPage(),
        riskAssessmentDetailPage: (context) => const RiskAssessmentDetailPage(),
        addNewRiskAssessment: (context) => const AddNewRiskAssessment(),
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
