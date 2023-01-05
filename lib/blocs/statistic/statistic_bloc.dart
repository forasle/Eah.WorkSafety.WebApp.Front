import 'dart:async';

import 'package:aeah_work_safety/blocs/statistic/models/statistic_response.dart';
import 'package:aeah_work_safety/blocs/statistic/repository/statistic_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'statistic_event.dart';
part 'statistic_state.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  final StatisticRepository _statisticRepository = locator<StatisticRepository>();


  StatisticBloc() : super(StatisticInitial()) {
    on<GetStatisticData>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 500));
      final statisticResponse = await _statisticRepository.getGeneralStatistic();
      emit(StatisticLoaded(statisticResponse: statisticResponse));
    });
  }
}
