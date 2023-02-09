import 'package:aeah_work_safety/blocs/accident/accident_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/accident_by_id_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/delete_accident_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/screens/components/search_bar.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccidentListView extends StatelessWidget {
  const AccidentListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refreshAccidentBloc = BlocProvider.of<AccidentBloc>(context);
    context.watch<AccidentBloc>().add(const GetAccidentData(needsRefresh: false));
    return BlocBuilder<AccidentBloc, AccidentState>(
      builder: (context, state) {
        if (state is AccidentDataError) {
          return Center(child: Text('Fetched Error: ${state.message}'));
        }
        if (state is AccidentDataLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMax) return false;
                context.read<AccidentBloc>().add(const GetAccidentData(needsRefresh: false));
              }
              return false;
            },
            child: Column(
              children: [
                const SearchBarWidget(),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async{
                      refreshAccidentBloc.add(const GetAccidentData(needsRefresh: true));
                    },
                    child: ListView.builder(

                      itemBuilder: (BuildContext context, int index) {
                        return index >= state.accidentResponse.length
                            ? const Center(
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(strokeWidth: 1.5),
                                ),
                              )
                            : Dismissible(

                              key: Key(state.accidentResponse[index].id.toString()),
                              onDismissed: (direction) {
                                context
                                    .read<DeleteAccidentBloc>()
                                    .add(DeleteAccident(id: state.accidentResponse[index].id));
                                //state.accidentResponse.data.removeAt(index);
                                //context.read()<AccidentBloc>(const GetAccidentData(needsRefresh: true));
                              },
                              child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: const Color(0xff764abc),
                                    child: Text(state.accidentResponse[index].id.toString()),
                                  ),
                                  title: Text(state.accidentResponse[index].referenceNumber),
                                  subtitle: Text(state.accidentResponse[index].accidentInfo),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            context
                                                .read<AccidentByIdBloc>()
                                                .add(GetAccidentDataById(id: state.accidentResponse[index].id));
                                              Navigator.pushNamed(
                                                context,
                                                updateAccidentPage,arguments:state.accidentResponse[index]
                                              );


                                          },
                                          icon: const Icon(Icons.change_circle)),
                                          /*
                                      IconButton(onPressed: () {
                                        context
                                            .read<DeleteAccidentBloc>()
                                            .add(DeleteAccident(id: state.accidentResponse[index].id));
                                        //state.accidentResponse.removeAt(index);
                                        //context.read()<AccidentBloc>(const GetAccidentData(needsRefresh: true));
                                      }, icon: const Icon(Icons.delete)),*/
                                      IconButton(
                                          onPressed: () {

                                            context
                                                .read<AccidentByIdBloc>()
                                                .add(GetAccidentDataById(id: state.accidentResponse[index].id));
                                            Navigator.pushNamed(
                                              context,
                                              accidentDetailPage,arguments:state.accidentResponse[index]
                                            );
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
                      itemCount: state.isReachedMax
                          ? state.accidentResponse.length
                          : state.accidentResponse.length + 1,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        if (state is AccidentDataFiltered) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMaxFiltered) return false;
                context.read<AccidentBloc>().add(GetAccidentFiltered(filter: state.filter));
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
                      return index >= state.accidentResponse.data.length
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
                          child: Text(state.accidentResponse.data[index].id.toString()),
                        ),
                        title: Text(state.accidentResponse.data[index].referenceNumber),
                        subtitle: Text(state.accidentResponse.data[index].accidentInfo),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  context
                                      .read<AccidentByIdBloc>()
                                      .add(GetAccidentDataById(id: state.accidentResponse.data[index].id));

                                  Navigator.pushNamed(
                                      context,
                                      updateAccidentPage,arguments:state.accidentResponse.data[index]
                                  );


                                },
                                icon: const Icon(Icons.change_circle)),
                            /*
                            IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),*/
                            IconButton(
                                onPressed: () {

                                  context
                                      .read<AccidentByIdBloc>()
                                      .add(GetAccidentDataById(id: state.accidentResponse.data[index].id));
                                  Navigator.pushNamed(
                                      context,
                                      accidentDetailPage,arguments:state.accidentResponse.data[index]
                                  );
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
                        ? state.accidentResponse.data.length
                        : state.accidentResponse.data.length + 1,
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
