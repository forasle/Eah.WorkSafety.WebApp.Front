part of 'inconsistency_by_id_bloc.dart';

abstract class InconsistencyByIdState extends Equatable {
  const InconsistencyByIdState();
}

class InconsistencyByIdInitial extends InconsistencyByIdState {
  @override
  List<Object> get props => [];
}

class InconsistencyDataLoadedById extends InconsistencyByIdState{
  final Inconsistency inconsistency;

  const InconsistencyDataLoadedById({required this.inconsistency});

  @override
  List<Object?> get props => [inconsistency];
}

class InconsistencyByIdDataError extends InconsistencyByIdState{
  final String message;

  const InconsistencyByIdDataError({required this.message});

  @override
  List<Object?> get props => [message];

}
