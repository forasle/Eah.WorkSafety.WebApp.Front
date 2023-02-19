part of 'delete_near_miss_bloc.dart';

abstract class DeleteNearMissState extends Equatable {
  const DeleteNearMissState();
}

class DeleteNearMissInitial extends DeleteNearMissState {
  @override
  List<Object> get props => [];
}

class DeleteNearMissCompleted extends DeleteNearMissState{
  final String message;

  const DeleteNearMissCompleted({required this.message});

  @override
  List<Object?> get props => [message];

}
class DeleteNearMissError extends DeleteNearMissState{
  final String message;

  const DeleteNearMissError({required this.message});

  @override
  List<Object?> get props => [message];

}

