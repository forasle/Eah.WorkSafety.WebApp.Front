part of 'occupation_disease_bloc.dart';


abstract class OccupationDiseaseEvent extends Equatable {
  const OccupationDiseaseEvent();

  @override
  List<Object> get props => [];
}

class GetOccupationDiseaseData extends OccupationDiseaseEvent{

  const GetOccupationDiseaseData();

  @override
  List<Object> get props => [];
}

class GetOccupationDiseaseFiltered extends OccupationDiseaseEvent{
  final String filter;
  const GetOccupationDiseaseFiltered({required this.filter});

  @override
  List<Object> get props => [filter];
}

class CreateNewOccupationDisease extends OccupationDiseaseEvent{
  final OccupationDisease occupationDisease;
  const CreateNewOccupationDisease({required this.occupationDisease});

  @override
  List<Object> get props => [occupationDisease];
}