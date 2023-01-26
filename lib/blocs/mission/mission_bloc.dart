import 'dart:async';

import 'package:aeah_work_safety/blocs/mission/models/mission_response.dart';
import 'package:aeah_work_safety/blocs/mission/models/mission.dart';
import 'package:aeah_work_safety/blocs/mission/repository/mission_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'mission_event.dart';
part 'mission_state.dart';

class MissionBloc extends Bloc<MissionEvent, MissionState> {
  final MissionRepository _missionRepository = locator<MissionRepository>();
  final List<Mission> _mission= [];
  List<Mission> _missionFiltered= [];
  int _page = 1;
  int _pageFiltered = 1;
  String _filter ="";
  final int _pageSize = 10;

  MissionBloc() : super(const MissionInitial(message: 'Bilgiler getiriliyor')) {

    on<GetMissionData>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        final missionResponse = await _missionRepository.getMissionData(page : _page,pageSize: _pageSize);
        _page = missionResponse.pageNumber!+1;
        _mission.addAll(missionResponse.data);
        missionResponse.data = _mission;
        emit(MissionDataLoaded(missionResponse: missionResponse, isReachedMax: missionResponse.nextPage==null));
      }
      catch(e){
        emit(MissionDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<GetMissionFiltered>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        _filter!=event.filter ? _pageFiltered=1 : _pageFiltered;
        _filter!=event.filter ? _missionFiltered = [] : _missionFiltered;
        final missionResponseFiltered = await _missionRepository.getMissionFiltered(page: _pageFiltered,pageSize: _pageSize,filter: event.filter);
        _pageFiltered = missionResponseFiltered.pageNumber!+1;
        _missionFiltered.addAll(missionResponseFiltered.data);
        missionResponseFiltered.data = _missionFiltered;
        _filter=event.filter;
        emit(MissionDataFiltered(missionResponse: missionResponseFiltered, filter: event.filter,isReachedMaxFiltered: missionResponseFiltered.nextPage==null));
      }
      catch(e){
        emit(MissionDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
    on<CreateNewMission>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));

      }
      catch(e){
        emit(NewMissionCreationError(message: "Bilgiler Eklenemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

  }
}


