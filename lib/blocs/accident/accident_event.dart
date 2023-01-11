part of 'accident_bloc.dart';

abstract class AccidentEvent extends Equatable {
  const AccidentEvent();

  @override
  List<Object> get props => [];
}

class GetAccidentData extends AccidentEvent{

  const GetAccidentData();

  @override
  List<Object> get props => [];
}

class GetAccidentFiltered extends AccidentEvent{
  final String filter;
  const GetAccidentFiltered({required this.filter});

  @override
  List<Object> get props => [filter];
}

class CreateNewAccident extends AccidentEvent{
  final Accident accident;
  const CreateNewAccident({required this.accident});

  @override
  List<Object> get props => [accident];
}