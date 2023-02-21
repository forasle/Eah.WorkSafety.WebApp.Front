part of 'preventive_activity_bloc.dart';

abstract class PreventiveActivityEvent extends Equatable {
  const PreventiveActivityEvent();

  @override
  List<Object> get props => [];
}

class PreventiveActivityInitialEvent extends PreventiveActivityEvent{
  const PreventiveActivityInitialEvent();
  @override
  List<Object> get props => [];
}

class GetPreventiveActivityData extends PreventiveActivityEvent{
  final bool needsRefresh;
  const GetPreventiveActivityData({required this.needsRefresh});

  @override
  List<Object> get props => [needsRefresh];
}

class GetPreventiveActivityFiltered extends PreventiveActivityEvent{
  final bool needsRefresh;
  final String filter;
  const GetPreventiveActivityFiltered({required this.filter,required this.needsRefresh});

  @override
  List<Object> get props => [filter,needsRefresh];
}