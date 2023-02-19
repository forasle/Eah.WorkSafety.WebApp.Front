
part of 'near_miss_by_id_bloc.dart';


abstract class NearMissByIdEvent extends Equatable {
  const NearMissByIdEvent();
  @override
  List<Object> get props => [];
}

class NearMissByIdInitialEvent extends NearMissByIdEvent{
  const NearMissByIdInitialEvent();

  @override
  List<Object> get props => [];
}

class GetNearMissDataById extends NearMissByIdEvent{
  final int id;
  const GetNearMissDataById({required this.id});

  @override
  List<Object> get props => [id];
}
