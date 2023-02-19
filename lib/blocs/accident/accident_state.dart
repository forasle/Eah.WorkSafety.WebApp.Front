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
  final List<Accident> accidentResponse;
  final bool isReachedMax;

  const AccidentDataLoaded({required this.accidentResponse,required this.isReachedMax});

  @override
  List<Object?> get props => [accidentResponse,isReachedMax];
}
class AccidentDataFiltered extends AccidentState{
  final String filter;
  final List<Accident> accidentResponse;
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


