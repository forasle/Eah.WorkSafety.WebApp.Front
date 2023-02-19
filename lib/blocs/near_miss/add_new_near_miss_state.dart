part of 'add_new_near_miss_bloc.dart';

abstract class AddNewNearMissState extends Equatable {
  const AddNewNearMissState();
}

class AddNewNearMissInitial extends AddNewNearMissState {
  @override
  List<Object> get props => [];
  const AddNewNearMissInitial();
}

class NewNearMissCreated extends AddNewNearMissState{
  final String message;

  const NewNearMissCreated({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewNearMissCreationError extends AddNewNearMissState{
  final String message;

  const NewNearMissCreationError({required this.message});

  @override
  List<Object?> get props => [message];

}
