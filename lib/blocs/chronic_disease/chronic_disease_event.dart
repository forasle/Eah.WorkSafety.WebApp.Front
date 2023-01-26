part of 'chronic_disease_bloc.dart';


abstract class ChronicDiseaseEvent extends Equatable {
  const ChronicDiseaseEvent();

  @override
  List<Object> get props => [];
}

class GetChronicDiseaseData extends ChronicDiseaseEvent{

  const GetChronicDiseaseData();

  @override
  List<Object> get props => [];
}

class GetChronicDiseaseFiltered extends ChronicDiseaseEvent{
  final String filter;
  const GetChronicDiseaseFiltered({required this.filter});

  @override
  List<Object> get props => [filter];
}

class CreateNewChronicDisease extends ChronicDiseaseEvent{
  final ChronicDisease chronicDisease;
  const CreateNewChronicDisease({required this.chronicDisease});

  @override
  List<Object> get props => [chronicDisease];
}