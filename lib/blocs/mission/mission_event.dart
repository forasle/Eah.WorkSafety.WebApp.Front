part of 'mission_bloc.dart';

abstract class MissionEvent extends Equatable {
  const MissionEvent();

  @override
  List<Object> get props => [];
}

class GetMissionData extends MissionEvent{

  const GetMissionData();

  @override
  List<Object> get props => [];
}

class GetMissionFiltered extends MissionEvent{
  final String filter;
  const GetMissionFiltered({required this.filter});

  @override
  List<Object> get props => [filter];
}

class CreateNewMission extends MissionEvent{
  final Mission mission;
  const CreateNewMission({required this.mission});

  @override
  List<Object> get props => [mission];
}
