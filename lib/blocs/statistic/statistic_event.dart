part of 'statistic_bloc.dart';

abstract class StatisticEvent extends Equatable {
  const StatisticEvent();
  @override
  List<Object> get props => [];
}
class GetStatisticData extends StatisticEvent{

  const GetStatisticData();

  @override
  List<Object> get props => [];
}