part of 'update_preventive_activity_bloc.dart';

abstract class UpdatePreventiveActivityState extends Equatable {
  const UpdatePreventiveActivityState();
}

class UpdatePreventiveActivityInitial extends UpdatePreventiveActivityState {
  @override
  List<Object> get props => [];

  const UpdatePreventiveActivityInitial();
}

class UpdatePreventiveActivityCompleted extends UpdatePreventiveActivityState{
  final String message;

  const UpdatePreventiveActivityCompleted({required this.message});

  @override
  List<Object?> get props => [message];

}
class UpdatePreventiveActivityError extends UpdatePreventiveActivityState{
  final String message;

  const UpdatePreventiveActivityError({required this.message});

  @override
  List<Object?> get props => [message];

}
