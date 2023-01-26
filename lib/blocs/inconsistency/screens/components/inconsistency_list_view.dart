import 'package:aeah_work_safety/blocs/inconsistency/screens/components/search_bar.dart';
import 'package:aeah_work_safety/blocs/inconsistency/inconsistency_bloc.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InconsistencyListView extends StatelessWidget {
  const InconsistencyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InconsistencyBloc, InconsistencyState>(
      builder: (context, state) {
        if (state is InconsistencyInitial) {
          context.read<InconsistencyBloc>().add(const GetInconsistencyData());
        }

        if (state is InconsistencyDataError) {
          return Center(child: Text('Fetched Error: ${state.message}'));
        }
        if (state is InconsistencyDataLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMax) return false;
                context.read<InconsistencyBloc>().add(const GetInconsistencyData());
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
                      return index >= state.inconsistencyResponse.data.length
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
                          child: Text(state.inconsistencyResponse.data[index].id.toString()),
                        ),
                        title: Text(state.inconsistencyResponse.data[index].information.toString() +
                            " " +
                            state.inconsistencyResponse.data[index].department.toString()),
                        subtitle: Text(state.inconsistencyResponse.data[index].information.toString()),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.pushNamed(context, workersDetailPageRoute,
                              arguments: state.inconsistencyResponse.data[index]);
                        },
                        onLongPress: () {
                          print("on long press");
                        },
                      );
                    },
                    itemCount: state.isReachedMax
                        ? state.inconsistencyResponse.data.length
                        : state.inconsistencyResponse.data.length + 1,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is InconsistencyDataFiltered) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMaxFiltered) return false;
                context.read<InconsistencyBloc>().add(GetInconsistencyFiltered(filter: state.filter));
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
                      return index >= state.inconsistencyResponse.data.length
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
                          child: Text(state.inconsistencyResponse.data[index].id.toString()),
                        ),
                        title: Text(state.inconsistencyResponse.data[index].status.toString() +
                            " " +
                            state.inconsistencyResponse.data[index].department.toString()),
                        subtitle: Text(state.inconsistencyResponse.data[index].information.toString()),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.pushNamed(context, workersDetailPageRoute,
                              arguments: state.inconsistencyResponse.data[index]);
                        },
                        onLongPress: () {
                          print("on long press");
                        },
                      );
                    },
                    itemCount: state.isReachedMaxFiltered
                        ? state.inconsistencyResponse.data.length
                        : state.inconsistencyResponse.data.length + 1,
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
