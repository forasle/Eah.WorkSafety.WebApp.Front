import 'package:aeah_work_safety/blocs/inconsistency/delete_inconsistency_bloc.dart';
import 'package:aeah_work_safety/blocs/inconsistency/inconsistency_by_id_bloc.dart';
import 'package:aeah_work_safety/blocs/inconsistency/screens/components/search_bar.dart';
import 'package:aeah_work_safety/blocs/inconsistency/inconsistency_bloc.dart';
import 'package:aeah_work_safety/constants/inconsistency/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class InconsistencyListView extends StatelessWidget {
  const InconsistencyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refreshInconsistencyBloc = BlocProvider.of<InconsistencyBloc>(context);
    context.read<InconsistencyBloc>().add(const GetInconsistencyData(needsRefresh: true));
    return Column(
      children: [
        const SearchBarWidget(),
        Expanded(
          child: BlocBuilder<InconsistencyBloc, InconsistencyState>(
            builder: (context, state) {
              if (state is InconsistencyDataError) {
                return Center(child: Text('Fetched Error: ${state.message}'));
              }
              if (state is InconsistencyDataLoaded) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                      if (state.isReachedMax) return false;
                      context.read<InconsistencyBloc>().add(const GetInconsistencyData(needsRefresh: false));
                    }
                    return false;
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            refreshInconsistencyBloc.add(const GetInconsistencyData(needsRefresh: true));
                          },
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return index >= state.inconsistencyResponse.length
                                  ? const Center(
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(strokeWidth: 1.5),
                                ),
                              )
                                  : Dismissible(
                                key: Key(state.inconsistencyResponse[index].id.toString()),
                                onDismissed: (direction) {

                                  context
                                      .read<DeleteInconsistencyBloc>()
                                      .add(DeleteInconsistency(id: state.inconsistencyResponse[index].id));
                                  //state.inconsistencyResponse.data.removeAt(index);
                                  //context.read()<InconsistencyBloc>(const GetInconsistencyData(needsRefresh: true));
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: const Color(0xff764abc),
                                    child: Text(state.inconsistencyResponse[index].id.toString()),
                                  ),
                                  title: Text(state.inconsistencyResponse[index].information.toString()),
                                  subtitle: Text(state.inconsistencyResponse[index].riskScore.toString()),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            context
                                                .read<InconsistencyByIdBloc>()
                                                .add(GetInconsistencyDataById(id: state.inconsistencyResponse[index].id));
                                            Navigator.pushNamed(context, updateInconsistencyPage,
                                                arguments: state.inconsistencyResponse[index]);
                                          },
                                          icon: const Icon(Icons.change_circle)),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text(
                                                    "${state.inconsistencyResponse[index].id} numaralı uygunsuzluğu silmek istediğinize emin misiniz?",
                                                    style: Constant.alertDialogTextStyle),
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      ElevatedButton(
                                                          child: const Text('Evet'),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                const SnackBar(content: Text("Kaza Silindi")));
                                                            context.read<DeleteInconsistencyBloc>().add(DeleteInconsistency(
                                                                id: state.inconsistencyResponse[index].id));
                                                            context.read<InconsistencyBloc>().add(const GetInconsistencyData(needsRefresh: true));
                                                          }),
                                                      Constant.sizedBox,
                                                      ElevatedButton(
                                                          child: const Text('İptal'),
                                                          onPressed: () => Navigator.pop(context)),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                            //context.read<InconsistencyBloc>().add(const GetInconsistencyData(needsRefresh: true));
                                            //state.inconsistencyResponse.removeAt(index);
                                          },
                                          icon: const Icon(Icons.delete)),
                                      IconButton(
                                          onPressed: () {
                                            context
                                                .read<InconsistencyByIdBloc>()
                                                .add(GetInconsistencyDataById(id: state.inconsistencyResponse[index].id));
                                            Navigator.pushNamed(context, inconsistencyDetailPage,
                                                arguments: state.inconsistencyResponse[index]);
                                          },
                                          icon: const Icon(Icons.arrow_forward)),
                                    ],
                                  ),
                                  onLongPress: () {
                                    print("on long press");
                                  },
                                ),
                              );
                            },
                            itemCount:
                            state.isReachedMax ? state.inconsistencyResponse.length : state.inconsistencyResponse.length + 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              /*
              if (state is InconsistencyDataFiltered) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                      if (state.isReachedMaxFiltered) return false;
                      context.read<InconsistencyBloc>().add(GetInconsistencyFiltered(filter: state.filter,needsRefresh: false));
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
                            return index >= state.inconsistencyResponse.length
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
                                      child: Text(state.inconsistencyResponse[index].id.toString()),
                                    ),
                                    title: Text(state.inconsistencyResponse[index].referenceNumber),
                                    subtitle: Text(state.inconsistencyResponse[index].inconsistencyInfo),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () async {
                                              context
                                                  .read<InconsistencyByIdBloc>()
                                                  .add(GetInconsistencyDataById(id: state.inconsistencyResponse[index].id));

                                              Navigator.pushNamed(context, updateInconsistencyPage,
                                                  arguments: state.inconsistencyResponse[index]);
                                            },
                                            icon: const Icon(Icons.change_circle)),
                                        /*
                                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),*/
                                        IconButton(
                                            onPressed: () {
                                              context
                                                  .read<InconsistencyByIdBloc>()
                                                  .add(GetInconsistencyDataById(id: state.inconsistencyResponse[index].id));
                                              Navigator.pushNamed(context, inconsistencyDetailPage,
                                                  arguments: state.inconsistencyResponse[index]);
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
                              ? state.inconsistencyResponse.length
                              : state.inconsistencyResponse.length + 1,
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

/*class InconsistencyListView extends StatelessWidget {
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
                          Navigator.pushNamed(context, employeeDetailPageRoute,
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
                          Navigator.pushNamed(context, employeeDetailPageRoute,
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
}*/
