import 'package:aeah_work_safety/blocs/employee/employee_bloc.dart';
import 'package:aeah_work_safety/blocs/employee/employee_by_id_bloc.dart';
import 'package:aeah_work_safety/blocs/employee/screens/components/search_bar.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeListView extends StatelessWidget {
  const EmployeeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refreshEmployeeBloc = BlocProvider.of<EmployeeBloc>(context);
    context.read<EmployeeBloc>().add(const GetEmployeeData(needsRefresh: true));
    return Column(
      children: [
        const SearchBarWidget(),
        Expanded(
          child: BlocBuilder<EmployeeBloc, EmployeeState>(
            builder: (context, state) {
              if (state is EmployeeDataError) {
                return Center(child: Text('Fetched Error: ${state.message}'));
              }
              if (state is EmployeeDataLoaded) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                      if (state.isReachedMax) return false;
                      context.read<EmployeeBloc>().add(const GetEmployeeData(needsRefresh: false));
                    }
                    return false;
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            refreshEmployeeBloc.add(const GetEmployeeData(needsRefresh: true));
                          },
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return index >= state.employeeResponse.length
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
                                        child: Text(state.employeeResponse[index].id.toString()),
                                      ),
                                      title: Text(state.employeeResponse[index].name +
                                          " " +
                                          state.employeeResponse[index].surname),
                                      subtitle: Text(state.employeeResponse[index].identificationNumber.toString()),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                context
                                                    .read<EmployeeByIdBloc>()
                                                    .add(GetEmployeeDataById(id: state.employeeResponse[index].id));
                                                Navigator.pushNamed(context, employeeDetailPageRoute,
                                                    arguments: state.employeeResponse[index]);
                                              },
                                              icon: const Icon(Icons.arrow_forward)),
                                        ],
                                      ),
                                      onLongPress: () {
                                        print("on long press");
                                      },
                                    );
                            },
                            itemCount:
                                state.isReachedMax ? state.employeeResponse.length : state.employeeResponse.length + 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              /*
              if (state is EmployeeDataFiltered) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                      if (state.isReachedMaxFiltered) return false;
                      context.read<EmployeeBloc>().add(GetEmployeeFiltered(filter: state.filter,needsRefresh: false));
                    }
                    return false;
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const Divider(
                              endIndent: 50,
                              indent: 50,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return index >= state.employeeResponse.length
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
                                      child: Text(state.employeeResponse[index].id.toString()),
                                    ),
                                    title: Text(state.employeeResponse[index].referenceNumber),
                                    subtitle: Text(state.employeeResponse[index].employeeInfo),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () async {
                                              context
                                                  .read<EmployeeByIdBloc>()
                                                  .add(GetEmployeeDataById(id: state.employeeResponse[index].id));

                                              Navigator.pushNamed(context, updateEmployeePage,
                                                  arguments: state.employeeResponse[index]);
                                            },
                                            icon: const Icon(Icons.change_circle)),
                                        /*
                                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),*/
                                        IconButton(
                                            onPressed: () {
                                              context
                                                  .read<EmployeeByIdBloc>()
                                                  .add(GetEmployeeDataById(id: state.employeeResponse[index].id));
                                              Navigator.pushNamed(context, employeeDetailPage,
                                                  arguments: state.employeeResponse[index]);
                                            },
                                            icon: const Icon(Icons.arrow_forward)),
                                      ],
                                    ),
                                    onLongPress: () {
                                      print("on long press");
                                    },
                                  );
                          },
                          itemCount: state.isReachedMaxFiltered
                              ? state.employeeResponse.length
                              : state.employeeResponse.length + 1,
                        ),
                      ),
                    ],
                  ),
                );
              }*/
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}

/*
class EmployeeListView extends StatelessWidget {
  const EmployeeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
        if (state is EmployeeInitial) {
          context.read<EmployeeBloc>().add(const GetEmployeeData(needsRefresh: true));
        }

        if (state is EmployeeDataError) {
          return Center(child: Text('Fetched Error: ${state.message}'));
        }
        if (state is EmployeeDataLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMax) return false;
                context.read<EmployeeBloc>().add(const GetEmployeeData(needsRefresh: true));
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
                      return index >= state.employeeResponse.length
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
                                child: Text(state.employeeResponse[index].name[0]),
                              ),
                              title: Text(state.employeeResponse[index].name +
                                  " " +
                                  state.employeeResponse[index].surname),
                              subtitle: Text(state.employeeResponse[index].department.toString()),
                              trailing: const Icon(Icons.arrow_forward_ios_rounded),
                              onTap: () {
                                Navigator.pushNamed(context, workersDetailPageRoute,
                                    arguments: state.employeeResponse[index]);
                              },
                              onLongPress: () {
                                print("on long press");
                              },
                            );
                    },
                    itemCount: state.isReachedMax
                        ? state.employeeResponse.length
                        : state.employeeResponse.length + 1,
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
                context.read<EmployeeBloc>().add(GetEmployeeFiltered(filter: state.filter,needsRefresh: true));
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
                      return index >= state.employeeResponse.length
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
                                child: Text(state.employeeResponse[index].name[0]),
                              ),
                              title: Text(state.employeeResponse[index].name +
                                  " " +
                                  state.employeeResponse[index].surname),
                              subtitle: Text(state.employeeResponse[index].department.toString()),
                              trailing: const Icon(Icons.arrow_forward_ios_rounded),
                              onTap: () {
                                Navigator.pushNamed(context, workersDetailPageRoute,
                                    arguments: state.employeeResponse[index]);
                              },
                              onLongPress: () {
                                print("on long press");
                              },
                            );
                    },
                    itemCount: state.isReachedMaxFiltered
                        ? state.employeeResponse.length
                        : state.employeeResponse.length + 1,
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
}*/
