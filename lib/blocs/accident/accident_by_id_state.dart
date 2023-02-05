part of 'accident_by_id_bloc.dart';

abstract class AccidentByIdState extends Equatable {
  const AccidentByIdState();
}

class AccidentByIdInitial extends AccidentByIdState {
  @override
  List<Object> get props => [];
}

class AccidentDataLoadedById extends AccidentByIdState{
  final Accident accident;

  const AccidentDataLoadedById({required this.accident});

  @override
  List<Object?> get props => [accident];
}

class AccidentByIdDataError extends AccidentByIdState{
  final String message;

  const AccidentByIdDataError({required this.message});

  @override
  List<Object?> get props => [message];

}
