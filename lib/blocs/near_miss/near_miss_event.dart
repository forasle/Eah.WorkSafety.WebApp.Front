part of 'near_miss_bloc.dart';

abstract class NearMissEvent extends Equatable {
  const NearMissEvent();

  @override
  List<Object> get props => [];
}

class NearMissInitialEvent extends NearMissEvent{
  const NearMissInitialEvent();
  @override
  List<Object> get props => [];
}

class GetNearMissData extends NearMissEvent{
  final bool needsRefresh;
  const GetNearMissData({required this.needsRefresh});

  @override
  List<Object> get props => [];
}

class GetNearMissFiltered extends NearMissEvent{
  final bool needsRefresh;
  final String filter;
  const GetNearMissFiltered({required this.filter,required this.needsRefresh});

  @override
  List<Object> get props => [filter];
}