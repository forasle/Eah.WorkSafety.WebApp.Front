part of 'chronic_disease_bloc.dart';

abstract class ChronicDiseaseEvent extends Equatable {
  const ChronicDiseaseEvent();

  @override
  List<Object> get props => [];
}

class ChronicDiseaseInitialEvent extends ChronicDiseaseEvent{
  const ChronicDiseaseInitialEvent();
  @override
  List<Object> get props => [];
}

class GetChronicDiseaseData extends ChronicDiseaseEvent{
  final bool needsRefresh;
  const GetChronicDiseaseData({required this.needsRefresh});

  @override
  List<Object> get props => [needsRefresh];
}

class GetChronicDiseaseFiltered extends ChronicDiseaseEvent{
  final bool needsRefresh;
  final String filter;
  const GetChronicDiseaseFiltered({required this.filter,required this.needsRefresh});

  @override
  List<Object> get props => [filter,needsRefresh];
}