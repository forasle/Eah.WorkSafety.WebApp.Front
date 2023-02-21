part of 'add_new_inconsistency_bloc.dart';

abstract class AddNewInconsistencyEvent extends Equatable {
  const AddNewInconsistencyEvent();
  @override
  List<Object> get props => [];
}

class CreateNewInconsistency extends AddNewInconsistencyEvent{
  final Map<String, dynamic> inconsistency;
  final String identificationNumber;
  const CreateNewInconsistency({required this.identificationNumber,required this.inconsistency});

  @override
  List<Object> get props => [inconsistency];
}