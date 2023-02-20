import 'package:aeah_work_safety/blocs/accident/accident_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/accident_by_id_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/add_new_accident_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/delete_accident_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/screens/components/update_accident.dart';
import 'package:aeah_work_safety/blocs/accident/update_accident_bloc.dart';
import 'package:aeah_work_safety/blocs/chronic_disease/chronic_disease_bloc.dart';
import 'package:aeah_work_safety/blocs/chronic_disease/screens/components/chronic_disease_detail_page.dart';
import 'package:aeah_work_safety/blocs/employee/employee_bloc.dart';
import 'package:aeah_work_safety/blocs/employee/employee_by_id_bloc.dart';
import 'package:aeah_work_safety/blocs/inconsistency/add_new_inconsistency_bloc.dart';
import 'package:aeah_work_safety/blocs/inconsistency/inconsistency_bloc.dart';
import 'package:aeah_work_safety/blocs/inconsistency/screens/components/update_inconsistency.dart';
import 'package:aeah_work_safety/blocs/inconsistency/update_inconsistency_bloc.dart';
import 'package:aeah_work_safety/blocs/mission/mission_bloc.dart';
import 'package:aeah_work_safety/blocs/mission/screens/components/mission_detail_page.dart';
import 'package:aeah_work_safety/blocs/near_miss/add_new_near_miss_bloc.dart';
import 'package:aeah_work_safety/blocs/near_miss/delete_near_miss_bloc.dart';
import 'package:aeah_work_safety/blocs/near_miss/near_miss_bloc.dart';
import 'package:aeah_work_safety/blocs/near_miss/near_miss_by_id_bloc.dart';
import 'package:aeah_work_safety/blocs/near_miss/screens/components/add_new_near_miss.dart';
import 'package:aeah_work_safety/blocs/near_miss/screens/components/update_near_miss.dart';
import 'package:aeah_work_safety/blocs/near_miss/update_near_miss_bloc.dart';
import 'package:aeah_work_safety/blocs/occupation_disease/occupation_disease_bloc.dart';
import 'package:aeah_work_safety/blocs/occupation_disease/screens/components/occupation_disease_detail_page.dart';
import 'package:aeah_work_safety/blocs/occupation_disease/screens/occupation_disease.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/preventive_activity_bloc.dart';
import 'package:aeah_work_safety/blocs/statistic/statistic_bloc.dart';
import 'package:aeah_work_safety/blocs/user/user_bloc.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:aeah_work_safety/blocs/chronic_disease/screens/chronic_diseases.dart';

import 'package:aeah_work_safety/widgets/components/add_new_employee.dart';
import 'package:aeah_work_safety/widgets/contingency_plan_page/components/add_new_contingency_plan.dart';
import 'package:aeah_work_safety/widgets/contingency_plan_page/components/contingency_plans_detail_page.dart';
import 'package:aeah_work_safety/widgets/contingency_plan_page/contingency_plan.dart';
import 'package:aeah_work_safety/blocs/statistic/screens/day_without_accident.dart';
import 'package:aeah_work_safety/widgets/education_page/components/add_new_education.dart';
import 'package:aeah_work_safety/blocs/employee/screens/components/employee_detail_page.dart';
import 'package:aeah_work_safety/blocs/employee/screens/employee.dart';
import 'package:aeah_work_safety/widgets/education_page/education_page.dart';
import 'package:aeah_work_safety/blocs/inconsistency/screens/components/add_new_inconsistency.dart';
import 'package:aeah_work_safety/blocs/inconsistency/screens/components/inconsistency_detail_page.dart';
import 'package:aeah_work_safety/blocs/inconsistency/screens/inconsistency.dart';
import 'package:aeah_work_safety/blocs/auth/screens/login.dart';
import 'package:aeah_work_safety/blocs/mission/screens/mission.dart';
import 'package:aeah_work_safety/blocs/near_miss/screens/components/near_miss_detail_page.dart';
import 'package:aeah_work_safety/blocs/near_miss/screens/near_miss.dart';
import 'package:aeah_work_safety/blocs/user/screens/panorama.dart';
import 'package:aeah_work_safety/widgets/periodic_medical_examination_page/periodic_medical_examination_page.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/screens/components/add_new_preventive_activity.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/screens/components/preventive_activity_detail_page.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/screens/preventive_activities.dart';
import 'package:aeah_work_safety/widgets/risk_assessment/components/add_new_risk_assessment.dart';
import 'package:aeah_work_safety/widgets/risk_assessment/components/risk_assessment_detail_page.dart';
import 'package:aeah_work_safety/widgets/risk_assessment/risk_assessment_page.dart';
import 'package:aeah_work_safety/blocs/accident/screens/components/accident_detail_page.dart';
import 'package:aeah_work_safety/blocs/accident/screens/accident.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'blocs/accident/screens/components/add_new_accident.dart';
import 'blocs/auth/auth_bloc.dart';
import 'blocs/inconsistency/inconsistency_by_id_bloc.dart';
import 'constants/main/constants.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => EmployeeBloc(),
        ),
        BlocProvider(
          create: (context) => StatisticBloc(),
        ),
        BlocProvider(
          create: (context) => AccidentBloc(),
        ),
        BlocProvider(
          create: (context) => NearMissBloc(),
        ),
        BlocProvider(
          create: (context) => PreventiveActivityBloc(),
        ),
        BlocProvider(
          create: (context) => InconsistencyBloc(),
        ),
        BlocProvider(
          create: (context) => InconsistencyByIdBloc(),
        ),
        BlocProvider(
          create: (context) => AddNewInconsistencyBloc(),
        ),
        BlocProvider(
          create: (context) => UpdateInconsistencyBloc(),
        ),
        BlocProvider(
          create: (context) => MissionBloc(),
        ),
        BlocProvider(
          create: (context) => ChronicDiseaseBloc(),
        ),
        BlocProvider(
          create: (context) => OccupationDiseaseBloc(),
        ),
        BlocProvider(
          create: (context) => EmployeeByIdBloc(),
        ),
        BlocProvider(
          create: (context) => AccidentByIdBloc(),
        ),
        BlocProvider(
          create: (context) => AddNewAccidentBloc(),
        ),
        BlocProvider(
          create: (context) => UpdateAccidentBloc(),
        ),
        BlocProvider(
          create: (context) => DeleteAccidentBloc(),
        ),
        BlocProvider(
          create: (context) => NearMissByIdBloc(),
        ),
        BlocProvider(
          create: (context) => AddNewNearMissBloc(),
        ),
        BlocProvider(
          create: (context) => UpdateNearMissBloc(),
        ),
        BlocProvider(
          create: (context) => DeleteNearMissBloc(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
        supportedLocales: const [Locale('en'), Locale('tr')],
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: Constant.materialAppTitle,
        theme: ThemeData(primarySwatch: Constant.themeDataPrimarySwatch, fontFamily: 'Roboto'),
        initialRoute: Constant.initialRoute,
        //initialRoute: '/Panorama/accident/addNewAccident',
        routes: {
          loginRoute: (context) => const Login(),
          panoramaRoute: (context) => const Panorama(),
          missionsPageRoute: (context) => const Mission(),
          employeeMainPageRoute: (context) => const Employee(),
          employeeDetailPageRoute: (context) => const EmployeeDetail(),
          dayWithoutAccidentPageRoute: (context) => const DayWithoutAccidentPage(),
          accidentPageRoute: (context) => const AccidentPage(),
          nearMissPageRoute: (context) => const NearMissPage(),
          inconsistenciesPageRoute: (context) => const Inconsistency(),
          preventiveActivitiesPageRoute: (context) => const PreventiveActivities(),
          educationPageRoute: (context) => const EducationPage(),
          chronicDiseasesPageRoute: (context) => const ChronicDisease(),
          chronicDiseaseDetailPageRoute : (context) => const ChronicDiseaseDetailPage(),
          occupationDiseasesPageRoute: (context) => const OccupationDisease(),
          occupationDiseaseDetailPageRoute :  (context) => const OccupationDiseaseDetailPage(),
          periodicMedicalExaminationPageRoute: (context) => const PeriodicMedicalExaminationPage(),
          addNewAccident: (context) => const AddNewAccident(),
          updateAccidentPage: (context) => const UpdateAccidentPage(),
          addNewNearMiss: (context) => const AddNewNearMiss(),
          addNewInconsistencies: (context) => const AddNewInconsistency(),
          nearMissDetailPage: (context) => const NearMissDetailPage(),
          updateNearMissPage: (context) => const UpdateNearMissPage(),
          accidentDetailPage: (context) => const AccidentDetailPage(),
          inconsistencyDetailPage: (context) => const InconsistencyDetailPage(),
          updateInconsistencyPage: (context) => const UpdateInconsistencyPage(),
          addNewPreventiveActivity: (context) => const AddNewPreventiveActivity(),
          preventiveActivityDetailPage: (context) => const PreventiveActivityDetailPage(),
          addNewEducation: (context) => const AddNewEducation(),
          contingencyPlanPage: (context) => const ContingencyPlanPage(),
          addNewContingencyPlan: (context) => const AddNewContingencyPlan(),
          contingencyPlanDetailPage: (context) => const ContingencyPlanDetailPage(),
          addNewWorker: (context) => const AddNewEmployee(),
          riskAssessmentPage: (context) => const RiskAssessmentPage(),
          riskAssessmentDetailPage: (context) => const RiskAssessmentDetailPage(),
          addNewRiskAssessment: (context) => const AddNewRiskAssessment(),
          missionDetailPageRoute : (context) => const MissionDetailPage(),

        },
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
