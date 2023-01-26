
import 'package:aeah_work_safety/blocs/occupation_disease/screens/components/search_bar.dart';
import 'package:aeah_work_safety/blocs/occupation_disease/occupation_disease_bloc.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OccupationDiseaseListView extends StatelessWidget {
  const OccupationDiseaseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OccupationDiseaseBloc, OccupationDiseaseState>(
      builder: (context, state) {
        if (state is OccupationDiseaseInitial) {
          context.read<OccupationDiseaseBloc>().add(const GetOccupationDiseaseData());
        }

        if (state is OccupationDiseaseDataError) {
          return Center(child: Text('Fetched Error: ${state.message}'));
        }
        if (state is OccupationDiseaseDataLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMax) return false;
                context.read<OccupationDiseaseBloc>().add(const GetOccupationDiseaseData());
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
                      return index >= state.occupationDiseaseResponse.data.length
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
                          child: Text(state.occupationDiseaseResponse.data[index].id.toString()),
                        ),
                        title: Text(state.occupationDiseaseResponse.data[index].diagnosis.toString()),
                        subtitle: Text(state.occupationDiseaseResponse.data[index].referenceNumber.toString()),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.pushNamed(context, occupationDiseaseDetailPageRoute,
                              arguments: state.occupationDiseaseResponse.data[index]);
                        },
                        onLongPress: () {
                          print("on long press");
                        },
                      );
                    },
                    itemCount: state.isReachedMax
                        ? state.occupationDiseaseResponse.data.length
                        : state.occupationDiseaseResponse.data.length + 1,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is OccupationDiseaseDataFiltered) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                if (state.isReachedMaxFiltered) return false;
                context.read<OccupationDiseaseBloc>().add(GetOccupationDiseaseFiltered(filter: state.filter));
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
                      return index >= state.occupationDiseaseResponse.data.length
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
                          child: Text(state.occupationDiseaseResponse.data[index].id.toString()),
                        ),
                        title: Text(state.occupationDiseaseResponse.data[index].diagnosis.toString()),
                        subtitle: Text(state.occupationDiseaseResponse.data[index].referenceNumber.toString()),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          Navigator.pushNamed(context, occupationDiseaseDetailPageRoute,
                              arguments: state.occupationDiseaseResponse.data[index]);
                        },
                        onLongPress: () {
                          print("on long press");
                        },
                      );
                    },
                    itemCount: state.isReachedMaxFiltered
                        ? state.occupationDiseaseResponse.data.length
                        : state.occupationDiseaseResponse.data.length + 1,
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
