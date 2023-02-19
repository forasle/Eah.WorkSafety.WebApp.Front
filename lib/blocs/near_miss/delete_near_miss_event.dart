part of 'delete_near_miss_bloc.dart';

abstract class DeleteNearMissEvent extends Equatable {
  const DeleteNearMissEvent();
}

class DeleteNearMiss extends DeleteNearMissEvent{
  final int id;
  const DeleteNearMiss({required this.id});

  @override
  List<Object> get props => [id];
}
