part of 'update_inconsistency_bloc.dart';

abstract class UpdateInconsistencyState extends Equatable {
  const UpdateInconsistencyState();
}

class UpdateInconsistencyInitial extends UpdateInconsistencyState {
  @override
  List<Object> get props => [];

  const UpdateInconsistencyInitial();
}

class UpdateInconsistencyCompleted extends UpdateInconsistencyState{
  final String message;

  const UpdateInconsistencyCompleted({required this.message});

  @override
  List<Object?> get props => [message];

}
class UpdateInconsistencyError extends UpdateInconsistencyState{
  final String message;

  const UpdateInconsistencyError({required this.message});

  @override
  List<Object?> get props => [message];

}
