part of 'chronic_disease_bloc.dart';

abstract class ChronicDiseaseState extends Equatable {
  const ChronicDiseaseState();
}

class ChronicDiseaseInitial extends ChronicDiseaseState {
  final String message;
  const ChronicDiseaseInitial({required this.message});

  @override
  List<Object?> get props => [message];
}

class ChronicDiseaseDataLoading extends ChronicDiseaseState{

  const ChronicDiseaseDataLoading();

  @override
  List<Object?> get props => [];
}

class ChronicDiseaseDataLoaded extends ChronicDiseaseState{
  final List<ChronicDisease> chronicDiseaseResponse;
  final bool isReachedMax;

  const ChronicDiseaseDataLoaded({required this.chronicDiseaseResponse,required this.isReachedMax});

  @override
  List<Object?> get props => [chronicDiseaseResponse,isReachedMax];
}
class ChronicDiseaseDataFiltered extends ChronicDiseaseState{
  final String filter;
  final List<ChronicDisease> chronicDiseaseResponse;
  final bool isReachedMaxFiltered;

  const ChronicDiseaseDataFiltered({required this.chronicDiseaseResponse,required this.isReachedMaxFiltered,required this.filter});

  @override
  List<Object?> get props => [chronicDiseaseResponse, isReachedMaxFiltered];
}

class ChronicDiseaseDataError extends ChronicDiseaseState{
  final String message;

  const ChronicDiseaseDataError({required this.message});

  @override
  List<Object?> get props => [message];

}


