part of 'add_new_inconsistency_bloc.dart';

abstract class AddNewInconsistencyState extends Equatable {
  const AddNewInconsistencyState();
}

class AddNewInconsistencyInitial extends AddNewInconsistencyState {
  @override
  List<Object> get props => [];
  const AddNewInconsistencyInitial();
}

class NewInconsistencyCreated extends AddNewInconsistencyState{
  final String message;

  const NewInconsistencyCreated({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewInconsistencyCreationError extends AddNewInconsistencyState{
  final String message;

  const NewInconsistencyCreationError({required this.message});

  @override
  List<Object?> get props => [message];

}
