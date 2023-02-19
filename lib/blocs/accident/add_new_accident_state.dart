part of 'add_new_accident_bloc.dart';

abstract class AddNewAccidentState extends Equatable {
  const AddNewAccidentState();
}

class AddNewAccidentInitial extends AddNewAccidentState {
  @override
  List<Object> get props => [];
  const AddNewAccidentInitial();
}

class NewAccidentCreated extends AddNewAccidentState{
  final String message;

  const NewAccidentCreated({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewAccidentCreationError extends AddNewAccidentState{
  final String message;

  const NewAccidentCreationError({required this.message});

  @override
  List<Object?> get props => [message];

}
