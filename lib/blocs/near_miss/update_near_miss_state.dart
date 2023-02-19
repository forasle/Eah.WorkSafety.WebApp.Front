part of 'update_near_miss_bloc.dart';

abstract class UpdateNearMissState extends Equatable {
  const UpdateNearMissState();
}

class UpdateNearMissInitial extends UpdateNearMissState {
  @override
  List<Object> get props => [];
  const UpdateNearMissInitial();
}

class UpdateNearMissCompleted extends UpdateNearMissState{
  final String message;

  const UpdateNearMissCompleted({required this.message});

  @override
  List<Object?> get props => [message];

}
class UpdateNearMissError extends UpdateNearMissState{
  final String message;

  const UpdateNearMissError({required this.message});

  @override
  List<Object?> get props => [message];

}
