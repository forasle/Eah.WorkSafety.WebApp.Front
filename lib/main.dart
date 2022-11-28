import 'package:eah_work_safety_web_app_front/pages/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants/constant.dart';
import 'constants/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('en'), Locale('tr')],
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: Constant.materialAppTitle,
      theme: ThemeData(primarySwatch: Constant.primarySwatch, scaffoldBackgroundColor: Constant.scaffoldBackgroundColor),
      initialRoute: Constant.initialRoute,
      routes: {
        loginRoute: (context) => const Login(),
        /*panaromaRoute: (context) => const Panaroma(),
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
        addNewRiskAssessment: (context) => const AddNewRiskAssessment(),*/
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
