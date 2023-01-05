import 'package:aeah_work_safety/blocs/employee/screens/components/employee_list_view.dart';
import 'package:aeah_work_safety/blocs/statistic/statistic_bloc.dart';
import 'package:aeah_work_safety/constants/employee/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/widgets/appBar/app_bar.dart';
import 'package:aeah_work_safety/widgets/components/routing_bar_widget.dart';
import 'package:aeah_work_safety/widgets/components/tappable_card_widget.dart';
import 'package:aeah_work_safety/widgets/components/circular_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Employee extends StatelessWidget {
  const Employee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final LoginResponse _loginResponse = ModalRoute.of(context)?.settings.arguments as LoginResponse;
    ScrollController horizontalController = ScrollController();
    context.read<StatisticBloc>().add(const GetStatisticData());
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
              child: BlocBuilder<StatisticBloc, StatisticState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      CustomCardWidget(
                          cardSubIcon: const Icon(null),
                          cardIcon: Icons.supervisor_account,
                          cardText: 'Toplam Çalışan',
                          cardDouble: state is StatisticLoaded ? state.statisticResponse.numberOfEmployee : '-',
                          cardColor: Colors.blueGrey,
                          customCardWidgetOnTap: null,
                          cardSubText: '-'),
                      CustomCardWidget(
                          cardSubIcon: const Icon(null),
                          cardIcon: Icons.account_tree_rounded,
                          cardText: 'Ortalama Yaş',
                          cardDouble:
                              state is StatisticLoaded ? state.statisticResponse.averageAgeOfEmployee.ceil() : '-',
                          cardColor: Colors.amberAccent.shade700,
                          customCardWidgetOnTap: null,
                          cardSubText: '-'),
                      CustomCardWidget(
                          cardSubIcon: const Icon(null),
                          cardIcon: Icons.access_time_outlined,
                          cardText: 'Ortalama Çalışma Süresi',
                          cardDouble:
                              state is StatisticLoaded ? state.statisticResponse.averageDayOfWork.ceil() / 100 : '-',
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
          //DataTableForEmployee(employeeResponse : state.employeeResponse),
          SizedBox(width: MediaQuery.of(context).size.width - 15, height: 500, child: const EmployeeListView()),
          //const AdvancedDataTable(),
          //const HomeScreen(),
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
            child: BlocBuilder<StatisticBloc, StatisticState>(
              builder: (context, state) {
                return Row(
                  children: [
                    if(state is StatisticLoaded) CircularGraph(

                      title: 'Yaş Dağılımı',
                      chartData: [
                        //ChartData('-16', state is StatisticLoaded ? state.statisticResponse.numberOfUser : 0),
                        ChartData('16-18', state.statisticResponse.totalLostDays.toDouble()),
                        ChartData('19-25', state.statisticResponse.totalLostDays.toDouble()),
                        ChartData('26-45', state.statisticResponse.totalLostDays.toDouble()),
                        ChartData('46-60', state.statisticResponse.totalLostDays.toDouble()),
                        ChartData('60+', state.statisticResponse.totalLostDays.toDouble()),

                      ],
                    ),
                    if(state is StatisticLoaded) CircularGraph(
                      title: 'Departmanlar',
                      chartData: [
                        ChartData('Acil', state.statisticResponse.totalLostDays.toDouble()),
                        ChartData('Yoğun Bakımlar', state.statisticResponse.totalLostDays.toDouble()),
                        ChartData('Ortopedi', state.statisticResponse.totalLostDays.toDouble()),
                        ChartData('Kardiyoloji', state.statisticResponse.totalLostDays.toDouble()),
                      ],
                    ),
                    if(state is StatisticLoaded) CircularGraph(
                      title: 'Cinsiyet Dağılımı',
                      chartData: [
                        ChartData('Erkek', state.statisticResponse.totalLostDays.toDouble()),
                        ChartData('Kadın', state.statisticResponse.totalLostDays.toDouble()),
                        ChartData('Belirtilmemiş', state.statisticResponse.totalLostDays.toDouble()),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Constant.dividerWithIndent,
        ],
      ),
    );
  }
}
