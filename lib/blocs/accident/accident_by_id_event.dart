part of 'accident_by_id_bloc.dart';

abstract class AccidentByIdEvent extends Equatable {
  const AccidentByIdEvent();
  @override
  List<Object> get props => [];
}

class AccidentByIdInitialEvent extends AccidentByIdEvent{
  const AccidentByIdInitialEvent();

  @override
  List<Object> get props => [];
}

class GetAccidentDataById extends AccidentByIdEvent{
  final int id;
  const GetAccidentDataById({required this.id});

  @override
  List<Object> get props => [id];
}
