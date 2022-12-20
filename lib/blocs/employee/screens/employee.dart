import 'package:aeah_work_safety/blocs/auth/models/login_response.dart';
import 'package:aeah_work_safety/blocs/employee/employee_bloc.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_request.dart';
import 'package:aeah_work_safety/blocs/employee/screens/components/data_table_for_employee.dart';
import 'package:aeah_work_safety/blocs/user/user_bloc.dart';
import 'package:aeah_work_safety/constants/employee/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/tappable_card_widget.dart';
import 'package:aeah_work_safety/widgets/components/circular_graph.dart';
import 'package:aeah_work_safety/widgets/components/column_graph.dart';
import 'package:aeah_work_safety/widgets/accident_page/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Employee extends StatelessWidget {
  const Employee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginResponse _loginResponse = ModalRoute.of(context)?.settings.arguments as LoginResponse;
    ScrollController horizontalController = ScrollController();
    context.read<EmployeeBloc>().add(GetEmployeeData(employeeRequest: EmployeeRequest(loginResponse: _loginResponse)));
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
        if (state is EmployeeInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is EmployeeData) {
          return CustomScaffold(
            body: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RoutingBarWidget(pageName: 'Panorama', routeName: panoramaRoute),
                    const Icon(Icons.arrow_right),
                    RoutingBarWidget(pageName: 'Çalışanlar', routeName: workersMainPageRoute),
                  ],
                ),
                Constant.dividerWithIndent,
                Column(
                  children: [
                    Padding(
                      padding: Constant.padding,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              'Çalışanlar',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                          Constant.sizedBoxWidth,
                          Flexible(
                            child: Text(
                              '(Yetki seviyenize göre görüntüleyebildiğiniz liste & raporlar)',
                              style: Theme.of(context).textTheme.overline,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: Constant.padding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(child: ElevatedButton(onPressed: () {}, child: const Text('Rapor Yazdır'))),
                          Constant.sizedBoxWidth,
                          const Flexible(
                            child: SearchBarWidget(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Scrollbar(
                  controller: horizontalController,
                  child: SingleChildScrollView(
                    padding: Constant.padding,
                    controller: horizontalController,
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            CustomCardWidget(
                                cardSubIcon: Icon(null),
                                cardIcon: Icons.supervisor_account,
                                cardText: 'Toplam Çalışan',
                                cardDouble: state is UserData ? state.statisticResponse.numberOfEmployee : '-',
                                cardColor: Colors.blueGrey,
                                customCardWidgetOnTap: null,
                                cardSubText: '-'),
                            CustomCardWidget(
                                cardSubIcon: const Icon(null),
                                cardIcon: Icons.account_tree_rounded,
                                cardText: 'Ortalama Yaş',
                                cardDouble: state is UserData ? state.statisticResponse.averageAgeOfEmployee : '-',
                                cardColor: Colors.amberAccent.shade700,
                                customCardWidgetOnTap: null,
                                cardSubText: '-'),
                            CustomCardWidget(
                                cardSubIcon: const Icon(null),
                                cardIcon: Icons.access_time_outlined,
                                cardText: 'Ortalama Çalışma Süresi',
                                cardDouble: state is UserData ? state.statisticResponse.averageDayOfWork : '-',
                                cardColor: Colors.orangeAccent.shade700,
                                customCardWidgetOnTap: null,
                                cardSubText: '-'),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Constant.dividerWithIndent,
                //DataTableForEmployee(),
                //ListView.builder(itemBuilder: itemBuilder),
                Constant.sizedBoxHeight,
                Constant.dividerWithIndent,
                Padding(
                  padding: Constant.padding,
                  child: Text(
                    'Rapor',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Constant.dividerWithIndent,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CircularGraph(
                        title: 'Yaş Dağılımı',
                        chartData: [
                          ChartData('David', 25),
                          ChartData('Steve', 38),
                          ChartData('Jack', 34),
                          ChartData('Others', 52),
                          ChartData('Others', 52),
                          ChartData('Others', 52),
                          ChartData('Others', 52),
                          ChartData('Others', 52)
                        ],
                      ),
                      CircularGraph(
                        title: 'Departmanlar',
                        chartData: [
                          ChartData('David', 25),
                          ChartData('Steve', 38),
                          ChartData('Jack', 34),
                          ChartData('Others', 52),
                        ],
                      ),
                      CircularGraph(
                        title: 'Cinsiyet Dağılımı',
                        chartData: [
                          ChartData('David', 25),
                          ChartData('Steve', 38),
                          ChartData('Jack', 34),
                        ],
                      ),
                      CircularGraph(
                        title: 'Kan Grubu',
                        chartData: [
                          ChartData('David', 25),
                          ChartData('Steve', 38),
                        ],
                      ),
                      ColumnGraph(
                        title: 'İşe Giriş Tarihi',
                      )
                    ],
                  ),
                ),
                Constant.dividerWithIndent,
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
