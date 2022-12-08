import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/chronic_diseases_page/chronic_diseases_page.dart';
import 'package:aeah_work_safety/widgets/components/add_new_near_miss.dart';
import 'package:aeah_work_safety/widgets/components/add_new_employee.dart';
import 'package:aeah_work_safety/widgets/contingency_plan_page/components/add_new_contingency_plan.dart';
import 'package:aeah_work_safety/widgets/contingency_plan_page/components/contingency_plans_detail_page.dart';
import 'package:aeah_work_safety/widgets/contingency_plan_page/contingency_plan.dart';
import 'package:aeah_work_safety/widgets/day_without_accident_page/day_without_accident.dart';
import 'package:aeah_work_safety/widgets/education_page/components/add_new_education.dart';
import 'package:aeah_work_safety/widgets/employee_detail_page/employee_detail_page.dart';
import 'package:aeah_work_safety/widgets/employee_page/employee.dart';
import 'package:aeah_work_safety/widgets/components/add_new_accident.dart';
import 'package:aeah_work_safety/widgets/education_page/education_page.dart';
import 'package:aeah_work_safety/widgets/inconsistency_page/components/add_new_inconsistency.dart';
import 'package:aeah_work_safety/widgets/inconsistency_page/components/inconsistency_detail_page.dart';
import 'package:aeah_work_safety/widgets/inconsistency_page/inconsistency_page.dart';
import 'package:aeah_work_safety/widgets/login_page/login.dart';
import 'package:aeah_work_safety/widgets/missionsPage/missions.dart';
import 'package:aeah_work_safety/widgets/near_miss_page/components/near_miss_detail_page.dart';
import 'package:aeah_work_safety/widgets/near_miss_page/near_miss.dart';
import 'package:aeah_work_safety/widgets/occupational_diseases_page/occupational_diseases_page.dart';
import 'package:aeah_work_safety/widgets/panorama_page/panorama.dart';
import 'package:aeah_work_safety/widgets/periodic_medical_examination_page/periodic_medical_examination_page.dart';
import 'package:aeah_work_safety/widgets/preventive_activities_page/components/add_new_preventive_activity.dart';
import 'package:aeah_work_safety/widgets/preventive_activities_page/components/preventive_activity_detail_page.dart';
import 'package:aeah_work_safety/widgets/preventive_activities_page/preventive_activities_page.dart';
import 'package:aeah_work_safety/widgets/risk_assessment/components/add_new_risk_assessment.dart';
import 'package:aeah_work_safety/widgets/risk_assessment/components/risk_assessment_detail_page.dart';
import 'package:aeah_work_safety/widgets/risk_assessment/risk_assessment_page.dart';
import 'package:aeah_work_safety/widgets/accident_page/components/accident_detail_page.dart';
import 'package:aeah_work_safety/widgets/accident_page/accident.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'constants/main/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
      supportedLocales: const [Locale('en'), Locale('tr')],
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: Constant.materialAppTitle,
      theme: ThemeData(primarySwatch: Constant.themeDataPrimarySwatch,fontFamily: 'Roboto'),
      initialRoute: Constant.initialRoute,
      routes: {
        loginRoute: (context) => const Login(),
        panoramaRoute: (context) => const Panorama(),
        missionsPageRoute: (context) => const Missions(),
        workersMainPageRoute: (context) => const Employee(),
        workersDetailPageRoute: (context) => const EmployeeDetail(),
        dayWithoutAccidentPageRoute: (context) =>
            const DayWithoutAccidentPage(),
        accidentPageRoute: (context) => const AccidentPage(),
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
        addNewAccident: (context) =>
            const AddNewAccident(),
        addNewNearMiss: (context) =>
        const AddNewNearMiss(),
        addNewInconsistencies: (context) => const AddNewInconsistency(),
        nearMissDetailPage: (context) => const NearMissDetailPage(),
        accidentDetailPage: (context) => const AccidentDetailPage(),
        inconsistenciesDetailPage: (context) =>
            const InconsistenciesDetailPage(),
        addNewPreventiveActivity: (context) => const AddNewPreventiveActivity(),
        preventiveActivityDetailPage: (context) =>
            const PreventiveActivityDetailPage(),
        addNewEducation: (context) => const AddNewEducation(),
        contingencyPlanPage: (context) => const ContingencyPlanPage(),
        addNewContingencyPlan: (context) => const AddNewContingencyPlan(),
        contingencyPlanDetailPage: (context) =>
            const ContingencyPlanDetailPage(),
        addNewWorker: (context) => const AddNewEmployee(),
        riskAssessmentPage: (context) => const RiskAssessmentPage(),
        riskAssessmentDetailPage: (context) => const RiskAssessmentDetailPage(),
        addNewRiskAssessment: (context) => const AddNewRiskAssessment(),
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
