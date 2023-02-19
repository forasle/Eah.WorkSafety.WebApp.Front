import 'package:aeah_work_safety/blocs/near_miss/near_miss_bloc.dart';
import 'package:aeah_work_safety/blocs/near_miss/near_miss_by_id_bloc.dart';
import 'package:aeah_work_safety/blocs/near_miss/delete_near_miss_bloc.dart';
import 'package:aeah_work_safety/blocs/near_miss/screens/components/search_bar.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aeah_work_safety/constants/near_miss/constants.dart';

class NearMissListView extends StatelessWidget {
  const NearMissListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refreshNearMissBloc = BlocProvider.of<NearMissBloc>(context);
    context.read<NearMissBloc>().add(const GetNearMissData(needsRefresh: true));
    return Column(
      children: [
        const SearchBarWidget(),
        Expanded(
          child: BlocBuilder<NearMissBloc, NearMissState>(
            builder: (context, state) {
              if (state is NearMissDataError) {
                return Center(child: Text('Fetched Error: ${state.message}'));
              }
              if (state is NearMissDataLoaded) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                      if (state.isReachedMax) return false;
                      context.read<NearMissBloc>().add(const GetNearMissData(needsRefresh: false));
                    }
                    return false;
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            refreshNearMissBloc.add(const GetNearMissData(needsRefresh: true));
                          },
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return index >= state.nearMissResponse.length
                                  ? const Center(
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(strokeWidth: 1.5),
                                ),
                              )
                                  : Dismissible(
                                key: Key(state.nearMissResponse[index].id.toString()),
                                onDismissed: (direction) {

                                  context
                                      .read<DeleteNearMissBloc>()
                                      .add(DeleteNearMiss(id: state.nearMissResponse[index].id));
                                  //state.nearMissResponse.data.removeAt(index);
                                  context.read()<NearMissBloc>(const GetNearMissData(needsRefresh: true));
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: const Color(0xff764abc),
                                    child: Text(state.nearMissResponse[index].id.toString()),
                                  ),
                                  title: Text(state.nearMissResponse[index]
                                      .affectedEmployeeWithPropertyForNearMiss[0].name +
                                      " " +
                                      state.nearMissResponse[index].affectedEmployeeWithPropertyForNearMiss[0]
                                          .surname),
                                  subtitle: Text(state.nearMissResponse[index].nearMissInfo),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            context
                                                .read<NearMissByIdBloc>()
                                                .add(GetNearMissDataById(id: state.nearMissResponse[index].id));
                                            Navigator.pushNamed(context, updateNearMissPage,
                                                arguments: state.nearMissResponse[index]);
                                          },
                                          icon: const Icon(Icons.change_circle)),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text(
                                                    "${state.nearMissResponse[index].affectedEmployeeWithPropertyForNearMiss[0].name + " " + state.nearMissResponse[index].affectedEmployeeWithPropertyForNearMiss[0].surname} kişisine ait iş kazasını silmek istediğinize emin misiniz?",
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
                                                            context.read<DeleteNearMissBloc>().add(DeleteNearMiss(
                                                                id: state.nearMissResponse[index].id));
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
                                            //context.read<NearMissBloc>().add(const GetNearMissData(needsRefresh: true));
                                            //state.nearMissResponse.removeAt(index);
                                          },
                                          icon: const Icon(Icons.delete)),
                                      IconButton(
                                          onPressed: () {
                                            context
                                                .read<NearMissByIdBloc>()
                                                .add(GetNearMissDataById(id: state.nearMissResponse[index].id));
                                            Navigator.pushNamed(context, nearMissDetailPage,
                                                arguments: state.nearMissResponse[index]);
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
                            state.isReachedMax ? state.nearMissResponse.length : state.nearMissResponse.length + 1,
                          ),
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
                      context.read<NearMissBloc>().add(GetNearMissFiltered(filter: state.filter, needsRefresh: true));
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
                            return index >= state.nearMissResponse.length
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
                                child: Text(state.nearMissResponse[index].id.toString()),
                              ),
                              title: Text(state.nearMissResponse[index].referenceNumber),
                              subtitle: Text(state.nearMissResponse[index].nearMissInfo),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        context
                                            .read<NearMissByIdBloc>()
                                            .add(GetNearMissDataById(id: state.nearMissResponse[index].id));

                                        Navigator.pushNamed(context, updateNearMissPage,
                                            arguments: state.nearMissResponse[index]);
                                      },
                                      icon: const Icon(Icons.change_circle)),
                                  /*
                                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),*/
                                  IconButton(
                                      onPressed: () {
                                        context
                                            .read<NearMissByIdBloc>()
                                            .add(GetNearMissDataById(id: state.nearMissResponse[index].id));
                                        Navigator.pushNamed(context, nearMissDetailPage,
                                            arguments: state.nearMissResponse[index]);
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
                              ? state.nearMissResponse.length
                              : state.nearMissResponse.length + 1,
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
