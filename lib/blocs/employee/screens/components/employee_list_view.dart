import 'package:aeah_work_safety/blocs/employee/employee_bloc.dart';
import 'package:aeah_work_safety/blocs/employee/screens/components/search_bar.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeListView extends StatelessWidget {
  const EmployeeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
        if (state is EmployeeInitial) {
          context.read<EmployeeBloc>().add(const GetEmployeeData());
        }

        if (state is EmployeeDataError) {
          return Center(child: Text('Fetched Error: ${state.message}'));
        }
        if (state is EmployeeDataLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMax) return false;
                context.read<EmployeeBloc>().add(const GetEmployeeData());
              }
              return false;
            },
            child: Column(
              children: [
                const SearchBarWidget(),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        endIndent: 50,
                        indent: 50,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return index >= state.employeeResponse.data.length
                          ? const Center(
                              child: SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(strokeWidth: 1.5),
                              ),
                            )
                          : ListTile(
                              leading: CircleAvatar(
                                backgroundColor: const Color(0xff764abc),
                                child: Text(state.employeeResponse.data[index].name[0]),
                              ),
                              title: Text(state.employeeResponse.data[index].name +
                                  " " +
                                  state.employeeResponse.data[index].surname),
                              subtitle: Text(state.employeeResponse.data[index].department),
                              trailing: const Icon(Icons.arrow_forward_ios_rounded),
                              onTap: () {
                                Navigator.pushNamed(context, workersDetailPageRoute,
                                    arguments: state.employeeResponse.data[index]);
                              },
                              onLongPress: () {
                                print("on long press");
                              },
                            );
                    },
                    itemCount: state.isReachedMax
                        ? state.employeeResponse.data.length
                        : state.employeeResponse.data.length + 1,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is EmployeeDataFiltered) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMaxFiltered) return false;
                context.read<EmployeeBloc>().add(GetEmployeeFiltered(filter: state.filter));
              }
              return false;
            },
            child: Column(
              children: [
                const SearchBarWidget(),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        endIndent: 50,
                        indent: 50,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return index >= state.employeeResponse.data.length
                          ? const Center(
                              child: SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(strokeWidth: 1.5),
                              ),
                            )
                          : ListTile(
                              leading: CircleAvatar(
                                backgroundColor: const Color(0xff764abc),
                                child: Text(state.employeeResponse.data[index].name[0]),
                              ),
                              title: Text(state.employeeResponse.data[index].name +
                                  " " +
                                  state.employeeResponse.data[index].surname),
                              subtitle: Text(state.employeeResponse.data[index].department),
                              trailing: const Icon(Icons.arrow_forward_ios_rounded),
                              onTap: () {
                                Navigator.pushNamed(context, workersDetailPageRoute,
                                    arguments: state.employeeResponse.data[index]);
                              },
                              onLongPress: () {
                                print("on long press");
                              },
                            );
                    },
                    itemCount: state.isReachedMaxFiltered
                        ? state.employeeResponse.data.length
                        : state.employeeResponse.data.length + 1,
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
