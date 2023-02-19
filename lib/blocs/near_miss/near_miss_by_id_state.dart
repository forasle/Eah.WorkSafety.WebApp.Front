part of 'near_miss_by_id_bloc.dart';

abstract class NearMissByIdState extends Equatable {
  const NearMissByIdState();
}

class NearMissByIdInitial extends NearMissByIdState {
  @override
  List<Object> get props => [];
}

class NearMissDataLoadedById extends NearMissByIdState{
  final NearMiss nearMiss;

  const NearMissDataLoadedById({required this.nearMiss});

  @override
  List<Object?> get props => [nearMiss];
}

class NearMissByIdDataError extends NearMissByIdState{
  final String message;

  const NearMissByIdDataError({required this.message});

  @override
  List<Object?> get props => [message];

}
