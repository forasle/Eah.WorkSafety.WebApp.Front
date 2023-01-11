part of 'accident_bloc.dart';

abstract class AccidentState extends Equatable {
  const AccidentState();
}

class AccidentInitial extends AccidentState {
  final String message;
  const AccidentInitial({required this.message});

  @override
  List<Object?> get props => [message];
}

class AccidentDataLoading extends AccidentState{

  const AccidentDataLoading();

  @override
  List<Object?> get props => [];
}

class AccidentDataLoaded extends AccidentState{
  final AccidentResponse accidentResponse;
  final bool isReachedMax;

  const AccidentDataLoaded({required this.accidentResponse,required this.isReachedMax});

  @override
  List<Object?> get props => [accidentResponse,isReachedMax];
}
class AccidentDataFiltered extends AccidentState{
  final String filter;
  final AccidentResponse accidentResponse;
  final bool isReachedMaxFiltered;

  const AccidentDataFiltered({required this.accidentResponse,required this.isReachedMaxFiltered,required this.filter});

  @override
  List<Object?> get props => [accidentResponse, isReachedMaxFiltered];
}

class AccidentDataError extends AccidentState{
  final String message;

  const AccidentDataError({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewAccidentCreated extends AccidentState{
  final String message;

  const NewAccidentCreated({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewAccidentCreationError extends AccidentState{
  final String message;

  const NewAccidentCreationError({required this.message});

  @override
  List<Object?> get props => [message];

}
