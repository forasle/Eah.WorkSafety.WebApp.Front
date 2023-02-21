part of 'preventive_activity_by_id_bloc.dart';

abstract class PreventiveActivityByIdEvent extends Equatable {
  const PreventiveActivityByIdEvent();
  @override
  List<Object> get props => [];
}

class PreventiveActivityByIdInitialEvent extends PreventiveActivityByIdEvent{
  const PreventiveActivityByIdInitialEvent();

  @override
  List<Object> get props => [];
}

class GetPreventiveActivityDataById extends PreventiveActivityByIdEvent{
  final int id;
  const GetPreventiveActivityDataById({required this.id});

  @override
  List<Object> get props => [id];
}
