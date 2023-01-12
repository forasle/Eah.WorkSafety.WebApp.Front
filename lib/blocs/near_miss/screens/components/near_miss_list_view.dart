import 'package:aeah_work_safety/blocs/near_miss/near_miss_bloc.dart';
import 'package:aeah_work_safety/blocs/employee/employee_bloc.dart';
import 'package:aeah_work_safety/blocs/employee/screens/components/search_bar.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NearMissListView extends StatelessWidget {
  const NearMissListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NearMissBloc, NearMissState>(
      builder: (context, state) {
        if (state is NearMissInitial) {
          context.read<NearMissBloc>().add(const GetNearMissData());
        }

        if (state is NearMissDataError) {
          return Center(child: Text('Fetched Error: ${state.message}'));
        }
        if (state is NearMissDataLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMax) return false;
                context.read<NearMissBloc>().add(const GetNearMissData());
              }
              return false;
            },
            child: Column(
              children: [
                //const SearchBarWidget(),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        endIndent: 50,
                        indent: 50,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return index >= state.nearMissResponse.data.length
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
                          child: Text(state.nearMissResponse.data[index].id.toString()),
                        ),
                        title: Text(state.nearMissResponse.data[index].referenceNumber),
                        subtitle: Text(state.nearMissResponse.data[index].nearMissInfo),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.pushNamed(context, workersDetailPageRoute,
                              arguments: state.nearMissResponse.data[index]);
                        },
                        onLongPress: () {
                          print("on long press");
                        },
                      );
                    },
                    itemCount: state.isReachedMax
                        ? state.nearMissResponse.data.length
                        : state.nearMissResponse.data.length + 1,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is NearMissDataFiltered) {
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
                      return index >= state.nearMissResponse.data.length
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
                          child: Text(state.nearMissResponse.data[index].id.toString()),
                        ),
                        title: Text(state.nearMissResponse.data[index].referenceNumber),
                        subtitle: Text(state.nearMissResponse.data[index].nearMissInfo),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.pushNamed(context, workersDetailPageRoute,
                              arguments: state.nearMissResponse.data[index]);
                        },
                        onLongPress: () {
                          print("on long press");
                        },
                      );
                    },
                    itemCount: state.isReachedMaxFiltered
                        ? state.nearMissResponse.data.length
                        : state.nearMissResponse.data.length + 1,
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
