import 'package:aeah_work_safety/blocs/preventive_activity/delete_preventive_activity_bloc.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/preventive_activity_bloc.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/preventive_activity_by_id_bloc.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/screens/components/search_bar.dart';
import 'package:aeah_work_safety/constants/preventive_activities/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreventiveActivityListView extends StatelessWidget {
  const PreventiveActivityListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refreshPreventiveActivityBloc = BlocProvider.of<PreventiveActivityBloc>(context);
    context.read<PreventiveActivityBloc>().add(const GetPreventiveActivityData(needsRefresh: true));
    return Column(
      children: [
        const SearchBarWidget(),
        Expanded(
          child: BlocBuilder<PreventiveActivityBloc, PreventiveActivityState>(
            builder: (context, state) {
              if (state is PreventiveActivityDataError) {
                return Center(child: Text('Fetched Error: ${state.message}'));
              }
              if (state is PreventiveActivityDataLoaded) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                      if (state.isReachedMax) return false;
                      context.read<PreventiveActivityBloc>().add(const GetPreventiveActivityData(needsRefresh: false));
                    }
                    return false;
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            refreshPreventiveActivityBloc.add(const GetPreventiveActivityData(needsRefresh: true));
                          },
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return index >= state.preventiveActivityResponse.length
                                  ? const Center(
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(strokeWidth: 1.5),
                                ),
                              )
                                  : Dismissible(
                                key: Key(state.preventiveActivityResponse[index].id.toString()),
                                onDismissed: (direction) {

                                  context
                                      .read<DeletePreventiveActivityBloc>()
                                      .add(DeletePreventiveActivity(id: state.preventiveActivityResponse[index].id));
                                  //state.preventiveActivityResponse.data.removeAt(index);
                                  //context.read()<PreventiveActivityBloc>(const GetPreventiveActivityData(needsRefresh: true));
                                },
                                child: ListTile(
                                  onTap: () {
                                    context
                                        .read<PreventiveActivityByIdBloc>()
                                        .add(GetPreventiveActivityDataById(id: state.preventiveActivityResponse[index].id));
                                    Navigator.pushNamed(context, preventiveActivityDetailPage,
                                        arguments: state.preventiveActivityResponse[index]);
                                  },
                                  leading: CircleAvatar(
                                    backgroundColor: const Color(0xff764abc),
                                    child: Text(state.preventiveActivityResponse[index].id.toString()),
                                  ),
                                  title: Text(state.preventiveActivityResponse[index].information.toString()),
                                  subtitle: Text(state.preventiveActivityResponse[index].deadline.toString()),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            context
                                                .read<PreventiveActivityByIdBloc>()
                                                .add(GetPreventiveActivityDataById(id: state.preventiveActivityResponse[index].id));
                                            Navigator.pushNamed(context, updatePreventiveActivityPage,
                                                arguments: state.preventiveActivityResponse[index]);
                                          },
                                          icon: const Icon(Icons.change_circle)),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text(
                                                    "${state.preventiveActivityResponse[index].id} numaralı uygunsuzluğu silmek istediğinize emin misiniz?",
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
                                                            context.read<DeletePreventiveActivityBloc>().add(DeletePreventiveActivity(
                                                                id: state.preventiveActivityResponse[index].id));
                                                            context.read<PreventiveActivityBloc>().add(const GetPreventiveActivityData(needsRefresh: true));
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
                                            //context.read<PreventiveActivityBloc>().add(const GetPreventiveActivityData(needsRefresh: true));
                                            //state.preventiveActivityResponse.removeAt(index);
                                          },
                                          icon: const Icon(Icons.delete)),
                                      IconButton(
                                          onPressed: () {
                                            context
                                                .read<PreventiveActivityByIdBloc>()
                                                .add(GetPreventiveActivityDataById(id: state.preventiveActivityResponse[index].id));
                                            Navigator.pushNamed(context, preventiveActivityDetailPage,
                                                arguments: state.preventiveActivityResponse[index]);
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
                            state.isReachedMax ? state.preventiveActivityResponse.length : state.preventiveActivityResponse.length + 1,
                          ),
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
