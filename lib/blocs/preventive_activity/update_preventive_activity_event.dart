part of 'update_preventive_activity_bloc.dart';

abstract class UpdatePreventiveActivityEvent extends Equatable {
  const UpdatePreventiveActivityEvent();

  @override
  List<Object> get props => [];
}

class UpdatePreventiveActivity extends UpdatePreventiveActivityEvent{
  final Map<String, dynamic> preventiveActivity;
  final int id;
  const UpdatePreventiveActivity({required this.preventiveActivity, required this.id});

  @override
  List<Object> get props => [preventiveActivity,id];
}
