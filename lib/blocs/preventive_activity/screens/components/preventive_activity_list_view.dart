import 'package:aeah_work_safety/blocs/preventive_activity/preventive_activity_bloc.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/screens/components/search_bar.dart';
import 'package:aeah_work_safety/blocs/employee/employee_bloc.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreventiveActivityListView extends StatelessWidget {
  const PreventiveActivityListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreventiveActivityBloc, PreventiveActivityState>(
      builder: (context, state) {
        if (state is PreventiveActivityInitial) {
          context.read<PreventiveActivityBloc>().add(const GetPreventiveActivityData());
        }

        if (state is PreventiveActivityDataError) {
          return Center(child: Text('Fetched Error: ${state.message}'));
        }
        if (state is PreventiveActivityDataLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMax) return false;
                context.read<PreventiveActivityBloc>().add(const GetPreventiveActivityData());
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
                      return index >= state.preventiveActivityResponse.data.length
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
                          child: Text(state.preventiveActivityResponse.data[index].id.toString()),
                        ),
                        title: Text(state.preventiveActivityResponse.data[index].name!),
                        subtitle: Text(state.preventiveActivityResponse.data[index].information!),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.pushNamed(context, preventiveActivityDetailPage,
                              arguments: state.preventiveActivityResponse.data[index]);
                        },
                        onLongPress: () {
                          print("on long press");
                        },
                      );
                    },
                    itemCount: state.isReachedMax
                        ? state.preventiveActivityResponse.data.length
                        : state.preventiveActivityResponse.data.length + 1,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is PreventiveActivityDataFiltered) {
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
                      return index >= state.preventiveActivityResponse.data.length
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
                          child: Text(state.preventiveActivityResponse.data[index].id.toString()),
                        ),
                        title: Text(state.preventiveActivityResponse.data[index].name!),
                        subtitle: Text(state.preventiveActivityResponse.data[index].information!),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.pushNamed(context, employeeDetailPageRoute,
                              arguments: state.preventiveActivityResponse.data[index]);
                        },
                        onLongPress: () {
                          print("on long press");
                        },
                      );
                    },
                    itemCount: state.isReachedMaxFiltered
                        ? state.preventiveActivityResponse.data.length
                        : state.preventiveActivityResponse.data.length + 1,
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
