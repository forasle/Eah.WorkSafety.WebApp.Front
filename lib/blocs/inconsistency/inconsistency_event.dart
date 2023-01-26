part of 'inconsistency_bloc.dart';


abstract class InconsistencyEvent extends Equatable {
  const InconsistencyEvent();

  @override
  List<Object> get props => [];
}

class GetInconsistencyData extends InconsistencyEvent{

  const GetInconsistencyData();

  @override
  List<Object> get props => [];
}

class GetInconsistencyFiltered extends InconsistencyEvent{
  final String filter;
  const GetInconsistencyFiltered({required this.filter});

  @override
  List<Object> get props => [filter];
}

class CreateNewInconsistency extends InconsistencyEvent{
  final Inconsistency inconsistency;
  const CreateNewInconsistency({required this.inconsistency});

  @override
  List<Object> get props => [inconsistency];
}

