part of 'mission_bloc.dart';

abstract class MissionState extends Equatable {
  const MissionState();
}

class MissionInitial extends MissionState {
  final String message;
  const MissionInitial({required this.message});

  @override
  List<Object?> get props => [message];
}

class MissionDataLoading extends MissionState{

  const MissionDataLoading();

  @override
  List<Object?> get props => [];
}

class MissionDataLoaded extends MissionState{
  final MissionResponse missionResponse;
  final bool isReachedMax;

  const MissionDataLoaded({required this.missionResponse,required this.isReachedMax});

  @override
  List<Object?> get props => [missionResponse,isReachedMax];
}
class MissionDataFiltered extends MissionState{
  final String filter;
  final MissionResponse missionResponse;
  final bool isReachedMaxFiltered;

  const MissionDataFiltered({required this.missionResponse,required this.isReachedMaxFiltered,required this.filter});

  @override
  List<Object?> get props => [missionResponse, isReachedMaxFiltered];
}

class MissionDataError extends MissionState{
  final String message;

  const MissionDataError({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewMissionCreated extends MissionState{
  final String message;

  const NewMissionCreated({required this.message});

  @override
  List<Object?> get props => [message];

}
class NewMissionCreationError extends MissionState{
  final String message;

  const NewMissionCreationError({required this.message});

  @override
  List<Object?> get props => [message];

}

