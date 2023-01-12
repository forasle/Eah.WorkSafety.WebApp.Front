part of 'near_miss_bloc.dart';

abstract class NearMissState extends Equatable {
  const NearMissState();
}

class NearMissInitial extends NearMissState {
  final String message;
  const NearMissInitial({required this.message});

  @override
  List<Object?> get props => [message];
}

class NearMissDataLoading extends NearMissState{

  const NearMissDataLoading();

  @override
  List<Object?> get props => [];
}

class NearMissDataLoaded extends NearMissState{
  final NearMissResponse nearMissResponse;
  final bool isReachedMax;

  const NearMissDataLoaded({required this.nearMissResponse,required this.isReachedMax});

  @override
  List<Object?> get props => [nearMissResponse,isReachedMax];
}
class NearMissDataFiltered extends NearMissState{
  final String filter;
  final NearMissResponse nearMissResponse;
  final bool isReachedMaxFiltered;

  const NearMissDataFiltered({required this.nearMissResponse,required this.isReachedMaxFiltered,required this.filter});

  @override
  List<Object?> get props => [nearMissResponse, isReachedMaxFiltered];
}

class NearMissDataError extends NearMissState{
  final String message;

  const NearMissDataError({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewNearMissCreated extends NearMissState{
  final String message;

  const NewNearMissCreated({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewNearMissCreationError extends NearMissState{
  final String message;

  const NewNearMissCreationError({required this.message});

  @override
  List<Object?> get props => [message];

}
