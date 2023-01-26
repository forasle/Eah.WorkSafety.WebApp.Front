part of 'preventive_activity_bloc.dart';



abstract class PreventiveActivityState extends Equatable {
  const PreventiveActivityState();
}

class PreventiveActivityInitial extends PreventiveActivityState {
  final String message;
  const PreventiveActivityInitial({required this.message});

  @override
  List<Object?> get props => [message];
}

class PreventiveActivityDataLoading extends PreventiveActivityState{

  const PreventiveActivityDataLoading();

  @override
  List<Object?> get props => [];
}

class PreventiveActivityDataLoaded extends PreventiveActivityState{
  final PreventiveActivityResponse preventiveActivityResponse;
  final bool isReachedMax;

  const PreventiveActivityDataLoaded({required this.preventiveActivityResponse,required this.isReachedMax});

  @override
  List<Object?> get props => [preventiveActivityResponse,isReachedMax];
}
class PreventiveActivityDataFiltered extends PreventiveActivityState{
  final String filter;
  final PreventiveActivityResponse preventiveActivityResponse;
  final bool isReachedMaxFiltered;

  const PreventiveActivityDataFiltered({required this.preventiveActivityResponse,required this.isReachedMaxFiltered,required this.filter});

  @override
  List<Object?> get props => [preventiveActivityResponse, isReachedMaxFiltered];
}

class PreventiveActivityDataError extends PreventiveActivityState{
  final String message;

  const PreventiveActivityDataError({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewPreventiveActivityCreated extends PreventiveActivityState{
  final String message;

  const NewPreventiveActivityCreated({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewPreventiveActivityCreationError extends PreventiveActivityState{
  final String message;

  const NewPreventiveActivityCreationError({required this.message});

  @override
  List<Object?> get props => [message];

}
