part of 'preventive_activity_bloc.dart';

abstract class PreventiveActivityEvent extends Equatable {
  const PreventiveActivityEvent();

  @override
  List<Object> get props => [];
}

class GetPreventiveActivityData extends PreventiveActivityEvent{

  const GetPreventiveActivityData();

  @override
  List<Object> get props => [];
}

class GetPreventiveActivityFiltered extends PreventiveActivityEvent{
  final String filter;
  const GetPreventiveActivityFiltered({required this.filter});

  @override
  List<Object> get props => [filter];
}

class CreateNewPreventiveActivity extends PreventiveActivityEvent{
  final PreventiveActivity preventiveActivity;
  const CreateNewPreventiveActivity({required this.preventiveActivity});

  @override
  List<Object> get props => [preventiveActivity];
}
