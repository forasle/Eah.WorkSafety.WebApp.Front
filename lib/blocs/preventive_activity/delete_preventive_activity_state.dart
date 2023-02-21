part of 'delete_preventive_activity_bloc.dart';

abstract class DeletePreventiveActivityState extends Equatable {
  const DeletePreventiveActivityState();
}

class DeletePreventiveActivityInitial extends DeletePreventiveActivityState {
  @override
  List<Object> get props => [];
}

class DeletePreventiveActivityCompleted extends DeletePreventiveActivityState{
  final String message;

  const DeletePreventiveActivityCompleted({required this.message});

  @override
  List<Object?> get props => [message];

}
class DeletePreventiveActivityError extends DeletePreventiveActivityState{
  final String message;

  const DeletePreventiveActivityError({required this.message});

  @override
  List<Object?> get props => [message];

}

