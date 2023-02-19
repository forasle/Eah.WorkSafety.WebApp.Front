part of 'update_near_miss_bloc.dart';

abstract class UpdateNearMissEvent extends Equatable {
  const UpdateNearMissEvent();

  @override
  List<Object> get props => [];
}

class UpdateNearMiss extends UpdateNearMissEvent{
  final Map<String, dynamic> nearMiss;
  final String identificationNumber;
  final int id;
  const UpdateNearMiss({required this.nearMiss, required this.id, required this.identificationNumber});

  @override
  List<Object> get props => [nearMiss,id];
}
