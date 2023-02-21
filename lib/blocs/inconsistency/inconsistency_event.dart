part of 'inconsistency_bloc.dart';

abstract class InconsistencyEvent extends Equatable {
  const InconsistencyEvent();

  @override
  List<Object> get props => [];
}

class InconsistencyInitialEvent extends InconsistencyEvent{
  const InconsistencyInitialEvent();
  @override
  List<Object> get props => [];
}

class GetInconsistencyData extends InconsistencyEvent{
  final bool needsRefresh;
  const GetInconsistencyData({required this.needsRefresh});

  @override
  List<Object> get props => [needsRefresh];
}

class GetInconsistencyFiltered extends InconsistencyEvent{
  final bool needsRefresh;
  final String filter;
  const GetInconsistencyFiltered({required this.filter,required this.needsRefresh});

  @override
  List<Object> get props => [filter,needsRefresh];
}