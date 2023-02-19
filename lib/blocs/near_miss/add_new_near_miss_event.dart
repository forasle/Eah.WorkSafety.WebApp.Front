part of 'add_new_near_miss_bloc.dart';

abstract class AddNewNearMissEvent extends Equatable {
  const AddNewNearMissEvent();
  @override
  List<Object> get props => [];
}

class CreateNewNearMiss extends AddNewNearMissEvent{
  final Map<String, dynamic> nearMiss;
  final String identificationNumber;
  const CreateNewNearMiss({required this.identificationNumber,required this.nearMiss});

  @override
  List<Object> get props => [nearMiss];
}