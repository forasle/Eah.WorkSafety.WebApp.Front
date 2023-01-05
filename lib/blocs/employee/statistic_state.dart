part of 'statistic_bloc.dart';

abstract class StatisticState extends Equatable {
  const StatisticState();
}

class StatisticInitial extends StatisticState {
  @override
  List<Object> get props => [];
}

class StatisticLoaded extends StatisticState{
  final StatisticResponse statisticResponse;
  const StatisticLoaded({required this.statisticResponse});

  @override
  List<Object?> get props => [statisticResponse];
}

class StatisticDataError extends StatisticState{
  final String message;
  const StatisticDataError({required this.message});

  @override
  List<Object?> get props => [message];
}
