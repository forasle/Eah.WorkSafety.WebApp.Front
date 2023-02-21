part of 'delete_inconsistency_bloc.dart';

abstract class DeleteInconsistencyState extends Equatable {
  const DeleteInconsistencyState();
}

class DeleteInconsistencyInitial extends DeleteInconsistencyState {
  @override
  List<Object> get props => [];
}

class DeleteInconsistencyCompleted extends DeleteInconsistencyState{
  final String message;

  const DeleteInconsistencyCompleted({required this.message});

  @override
  List<Object?> get props => [message];

}
class DeleteInconsistencyError extends DeleteInconsistencyState{
  final String message;

  const DeleteInconsistencyError({required this.message});

  @override
  List<Object?> get props => [message];

}

