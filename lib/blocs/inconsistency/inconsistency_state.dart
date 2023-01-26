part of 'inconsistency_bloc.dart';

abstract class InconsistencyState extends Equatable {
  const InconsistencyState();
}

class InconsistencyInitial extends InconsistencyState {
  final String message;
  const InconsistencyInitial({required this.message});

  @override
  List<Object?> get props => [message];
}

class InconsistencyDataLoading extends InconsistencyState{

  const InconsistencyDataLoading();

  @override
  List<Object?> get props => [];
}

class InconsistencyDataLoaded extends InconsistencyState{
  final InconsistencyResponse inconsistencyResponse;
  final bool isReachedMax;

  const InconsistencyDataLoaded({required this.inconsistencyResponse,required this.isReachedMax});

  @override
  List<Object?> get props => [inconsistencyResponse,isReachedMax];
}
class InconsistencyDataFiltered extends InconsistencyState{
  final String filter;
  final InconsistencyResponse inconsistencyResponse;
  final bool isReachedMaxFiltered;

  const InconsistencyDataFiltered({required this.inconsistencyResponse,required this.isReachedMaxFiltered,required this.filter});

  @override
  List<Object?> get props => [inconsistencyResponse, isReachedMaxFiltered];
}

class InconsistencyDataError extends InconsistencyState{
  final String message;

  const InconsistencyDataError({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewInconsistencyCreated extends InconsistencyState{
  final String message;

  const NewInconsistencyCreated({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewInconsistencyCreationError extends InconsistencyState{
  final String message;

  const NewInconsistencyCreationError({required this.message});

  @override
  List<Object?> get props => [message];

}
