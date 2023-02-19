import 'package:aeah_work_safety/blocs/accident/accident_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/accident_by_id_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/delete_accident_bloc.dart';
import 'package:aeah_work_safety/blocs/accident/screens/components/search_bar.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aeah_work_safety/constants/accident/constants.dart';

class AccidentListView extends StatelessWidget {
  const AccidentListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refreshAccidentBloc = BlocProvider.of<AccidentBloc>(context);
    context.read<AccidentBloc>().add(const GetAccidentData(needsRefresh: true));
    return Column(
      children: [
        const SearchBarWidget(),
        Expanded(
          child: BlocBuilder<AccidentBloc, AccidentState>(
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
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
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
                                        title: Text(state.accidentResponse[index]
                                                .affectedEmployeeWithPropertyForAccident[0].name +
                                            " " +
                                            state.accidentResponse[index].affectedEmployeeWithPropertyForAccident[0]
                                                .surname),
                                        subtitle: Text(state.accidentResponse[index].accidentInfo),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                                onPressed: () async {
                                                  context
                                                      .read<AccidentByIdBloc>()
                                                      .add(GetAccidentDataById(id: state.accidentResponse[index].id));
                                                  Navigator.pushNamed(context, updateAccidentPage,
                                                      arguments: state.accidentResponse[index]);
                                                },
                                                icon: const Icon(Icons.change_circle)),
                                            IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) => AlertDialog(
                                                      title: Text(
                                                          "${state.accidentResponse[index].affectedEmployeeWithPropertyForAccident[0].name + " " + state.accidentResponse[index].affectedEmployeeWithPropertyForAccident[0].surname} kişisine ait iş kazasını silmek istediğinize emin misiniz?",
                                                          style: Constant.allertDialogTextStyle),
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
                                                                  context.read<DeleteAccidentBloc>().add(DeleteAccident(
                                                                      id: state.accidentResponse[index].id));
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
                                                  //context.read<AccidentBloc>().add(const GetAccidentData(needsRefresh: true));
                                                  //state.accidentResponse.removeAt(index);
                                                },
                                                icon: const Icon(Icons.delete)),
                                            IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<AccidentByIdBloc>()
                                                      .add(GetAccidentDataById(id: state.accidentResponse[index].id));
                                                  Navigator.pushNamed(context, accidentDetailPage,
                                                      arguments: state.accidentResponse[index]);
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
                                state.isReachedMax ? state.accidentResponse.length : state.accidentResponse.length + 1,
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
                      context.read<AccidentBloc>().add(GetAccidentFiltered(filter: state.filter,needsRefresh: false));
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
                            return index >= state.accidentResponse.length
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

                                              Navigator.pushNamed(context, updateAccidentPage,
                                                  arguments: state.accidentResponse[index]);
                                            },
                                            icon: const Icon(Icons.change_circle)),
                                        /*
                                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),*/
                                        IconButton(
                                            onPressed: () {
                                              context
                                                  .read<AccidentByIdBloc>()
                                                  .add(GetAccidentDataById(id: state.accidentResponse[index].id));
                                              Navigator.pushNamed(context, accidentDetailPage,
                                                  arguments: state.accidentResponse[index]);
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
                              ? state.accidentResponse.length
                              : state.accidentResponse.length + 1,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
