import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/loginPage/login.dart';
import 'package:aeah_work_safety/widgets/homePage/panaroma.dart';
import 'package:aeah_work_safety/widgets/missionsPage/missions.dart';
import 'package:aeah_work_safety/widgets/workersPage/workersPage.dart';
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
        missionsRoute: (context) => const Missions(),
        workersPageRoute: (context) => const WorkersPage(),
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
