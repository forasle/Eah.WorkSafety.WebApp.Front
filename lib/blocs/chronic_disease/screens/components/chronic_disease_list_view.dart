import 'package:aeah_work_safety/blocs/chronic_disease/chronic_disease_bloc.dart';
import 'package:aeah_work_safety/blocs/chronic_disease/screens/components/search_bar.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChronicDiseaseListView extends StatelessWidget {
  const ChronicDiseaseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChronicDiseaseBloc, ChronicDiseaseState>(
      builder: (context, state) {
        if (state is ChronicDiseaseInitial) {
          context.read<ChronicDiseaseBloc>().add(const GetChronicDiseaseData());
        }

        if (state is ChronicDiseaseDataError) {
          return Center(child: Text('Fetched Error: ${state.message}'));
        }
        if (state is ChronicDiseaseDataLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMax) return false;
                context.read<ChronicDiseaseBloc>().add(const GetChronicDiseaseData());
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
                      return index >= state.chronicDiseaseResponse.data.length
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
                          child: Text(state.chronicDiseaseResponse.data[index].id.toString()),
                        ),
                        title: Text(state.chronicDiseaseResponse.data[index].diagnosis.toString()),
                        subtitle: Text(state.chronicDiseaseResponse.data[index].referenceNumber.toString()),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.pushNamed(context, chronicDiseaseDetailPageRoute,
                              arguments: state.chronicDiseaseResponse.data[index]);
                        },
                        onLongPress: () {
                          print("on long press");
                        },
                      );
                    },
                    itemCount: state.isReachedMax
                        ? state.chronicDiseaseResponse.data.length
                        : state.chronicDiseaseResponse.data.length + 1,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is ChronicDiseaseDataFiltered) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMaxFiltered) return false;
                context.read<ChronicDiseaseBloc>().add(GetChronicDiseaseFiltered(filter: state.filter));
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
                      return index >= state.chronicDiseaseResponse.data.length
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
                          child: Text(state.chronicDiseaseResponse.data[index].id.toString()),
                        ),
                        title: Text(state.chronicDiseaseResponse.data[index].diagnosis.toString()),
                        subtitle: Text(state.chronicDiseaseResponse.data[index].referenceNumber.toString()),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.pushNamed(context, chronicDiseaseDetailPageRoute,
                              arguments: state.chronicDiseaseResponse.data[index]);
                        },
                        onLongPress: () {
                          print("on long press");
                        },
                      );
                    },
                    itemCount: state.isReachedMaxFiltered
                        ? state.chronicDiseaseResponse.data.length
                        : state.chronicDiseaseResponse.data.length + 1,
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
