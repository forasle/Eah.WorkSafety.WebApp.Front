import 'package:aeah_work_safety/blocs/mission/screens/components/search_bar.dart';
import 'package:aeah_work_safety/blocs/mission/mission_bloc.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MissionListView extends StatelessWidget {
  const MissionListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MissionBloc, MissionState>(
      builder: (context, state) {
        if (state is MissionInitial) {
          context.read<MissionBloc>().add(const GetMissionData());
        }

        if (state is MissionDataError) {
          return Center(child: Text('Fetched Error: ${state.message}'));
        }
        if (state is MissionDataLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMax) return false;
                context.read<MissionBloc>().add(const GetMissionData());
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
                      return index >= state.missionResponse.data.length
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
                          child: Text(state.missionResponse.data[index].id.toString()),
                        ),
                        title: Text(state.missionResponse.data[index].name),
                        subtitle: Text(state.missionResponse.data[index].department),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.pushNamed(context, missionDetailPageRoute,
                              arguments: state.missionResponse.data[index]);
                        },
                        onLongPress: () {
                          print("on long press");
                        },
                      );
                    },
                    itemCount: state.isReachedMax
                        ? state.missionResponse.data.length
                        : state.missionResponse.data.length + 1,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is MissionDataFiltered) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMaxFiltered) return false;
                context.read<MissionBloc>().add(GetMissionFiltered(filter: state.filter));
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
                      return index >= state.missionResponse.data.length
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
                          child: Text(state.missionResponse.data[index].id.toString()),
                        ),
                        title: Text(state.missionResponse.data[index].name),
                        subtitle: Text(state.missionResponse.data[index].department),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.pushNamed(context, missionDetailPageRoute,
                              arguments: state.missionResponse.data[index]);
                        },
                        onLongPress: () {
                          print("on long press");
                        },
                      );
                    },
                    itemCount: state.isReachedMaxFiltered
                        ? state.missionResponse.data.length
                        : state.missionResponse.data.length + 1,
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
