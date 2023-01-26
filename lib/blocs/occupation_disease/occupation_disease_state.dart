part of 'occupation_disease_bloc.dart';

abstract class OccupationDiseaseState extends Equatable {
  const OccupationDiseaseState();
}

class OccupationDiseaseInitial extends OccupationDiseaseState {
  final String message;
  const OccupationDiseaseInitial({required this.message});

  @override
  List<Object?> get props => [message];
}

class OccupationDiseaseDataLoading extends OccupationDiseaseState{

  const OccupationDiseaseDataLoading();

  @override
  List<Object?> get props => [];
}

class OccupationDiseaseDataLoaded extends OccupationDiseaseState{
  final OccupationDiseaseResponse occupationDiseaseResponse;
  final bool isReachedMax;

  const OccupationDiseaseDataLoaded({required this.occupationDiseaseResponse,required this.isReachedMax});

  @override
  List<Object?> get props => [occupationDiseaseResponse,isReachedMax];
}
class OccupationDiseaseDataFiltered extends OccupationDiseaseState{
  final String filter;
  final OccupationDiseaseResponse occupationDiseaseResponse;
  final bool isReachedMaxFiltered;

  const OccupationDiseaseDataFiltered({required this.occupationDiseaseResponse,required this.isReachedMaxFiltered,required this.filter});

  @override
  List<Object?> get props => [occupationDiseaseResponse, isReachedMaxFiltered];
}

class OccupationDiseaseDataError extends OccupationDiseaseState{
  final String message;

  const OccupationDiseaseDataError({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewOccupationDiseaseCreated extends OccupationDiseaseState{
  final String message;

  const NewOccupationDiseaseCreated({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewOccupationDiseaseCreationError extends OccupationDiseaseState{
  final String message;

  const NewOccupationDiseaseCreationError({required this.message});

  @override
  List<Object?> get props => [message];

}
