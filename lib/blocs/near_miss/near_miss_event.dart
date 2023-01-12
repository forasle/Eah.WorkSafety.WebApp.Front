part of 'near_miss_bloc.dart';

abstract class NearMissEvent extends Equatable {
  const NearMissEvent();

  @override
  List<Object> get props => [];
}

class GetNearMissData extends NearMissEvent{

  const GetNearMissData();

  @override
  List<Object> get props => [];
}

class GetNearMissFiltered extends NearMissEvent{
  final String filter;
  const GetNearMissFiltered({required this.filter});

  @override
  List<Object> get props => [filter];
}

class CreateNewNearMiss extends NearMissEvent{
  final NearMiss nearMiss;
  const CreateNewNearMiss({required this.nearMiss});

  @override
  List<Object> get props => [nearMiss];
}