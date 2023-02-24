import 'package:aeah_work_safety/blocs/chronic_disease/chronic_disease_bloc.dart';
import 'package:aeah_work_safety/blocs/chronic_disease/screens/components/search_bar.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/constants/chronic_disease/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChronicDiseaseListView extends StatelessWidget {
  const ChronicDiseaseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refreshChronicDiseaseBloc = BlocProvider.of<ChronicDiseaseBloc>(context);
    context.read<ChronicDiseaseBloc>().add(const GetChronicDiseaseData(needsRefresh: true));
    return Column(
      children: [
        const SearchBarWidget(),
        Expanded(
          child: BlocBuilder<ChronicDiseaseBloc, ChronicDiseaseState>(
            builder: (context, state) {
              if (state is ChronicDiseaseDataError) {
                return Center(child: Text('Fetched Error: ${state.message}'));
              }
              if (state is ChronicDiseaseDataLoaded) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                      if (state.isReachedMax) return false;
                      context.read<ChronicDiseaseBloc>().add(const GetChronicDiseaseData(needsRefresh: false));
                    }
                    return false;
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            refreshChronicDiseaseBloc.add(const GetChronicDiseaseData(needsRefresh: true));
                          },
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return index >= state.chronicDiseaseResponse.length
                                  ? const Center(
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(strokeWidth: 1.5),
                                ),
                              )
                                  : Dismissible(
                                key: Key(state.chronicDiseaseResponse[index].id.toString()),
                                onDismissed: (direction) {

                                  //context
                                   //   .read<DeleteChronicDiseaseBloc>()
                                 //     .add(DeleteChronicDisease(id: state.chronicDiseaseResponse[index].id));
                                  //state.chronicDiseaseResponse.data.removeAt(index);
                                  //context.read()<ChronicDiseaseBloc>(const GetChronicDiseaseData(needsRefresh: true));
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: const Color(0xff764abc),
                                    child: Text(state.chronicDiseaseResponse[index].id.toString()),
                                  ),
                                  title: Text(state.chronicDiseaseResponse[index].diagnosis.toString()),
                                  subtitle: Text(state.chronicDiseaseResponse[index].referenceNumber.toString()),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                           // context
                                          //      .read<ChronicDiseaseByIdBloc>()
                                          //      .add(GetChronicDiseaseDataById(id: state.chronicDiseaseResponse[index].id));
                                         //   Navigator.pushNamed(context, updateChronicDiseasePage,
                                          //      arguments: state.chronicDiseaseResponse[index]);
                                          },
                                          icon: const Icon(Icons.change_circle)),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text(
                                                    "${state.chronicDiseaseResponse[index].id} numaralı uygunsuzluğu silmek istediğinize emin misiniz?",
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
                                                            //context.read<DeleteChronicDiseaseBloc>().add(DeleteChronicDisease(
                                                                //id: state.chronicDiseaseResponse[index].id));
                                                            context.read<ChronicDiseaseBloc>().add(const GetChronicDiseaseData(needsRefresh: true));
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
                                            //context.read<ChronicDiseaseBloc>().add(const GetChronicDiseaseData(needsRefresh: true));
                                            //state.chronicDiseaseResponse.removeAt(index);
                                          },
                                          icon: const Icon(Icons.delete)),
                                      IconButton(
                                          onPressed: () {
                                           // context
                                             //   .read<ChronicDiseaseByIdBloc>()
                                              //  .add(GetChronicDiseaseDataById(id: state.chronicDiseaseResponse[index].id));
                                            //Navigator.pushNamed(context, chronicDiseaseDetailPage,
                                             //   arguments: state.chronicDiseaseResponse[index]);
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
                            state.isReachedMax ? state.chronicDiseaseResponse.length : state.chronicDiseaseResponse.length + 1,
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
