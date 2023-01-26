import 'dart:async';

import 'package:aeah_work_safety/blocs/occupation_disease/models/occupation_disease.dart';
import 'package:aeah_work_safety/blocs/occupation_disease/models/occupation_disease_response.dart';
import 'package:aeah_work_safety/blocs/occupation_disease/repository/chronic_disease_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'occupation_disease_event.dart';
part 'occupation_disease_state.dart';


class OccupationDiseaseBloc extends Bloc<OccupationDiseaseEvent, OccupationDiseaseState> {
  final OccupationDiseaseRepository _occupationDiseaseRepository = locator<OccupationDiseaseRepository>();
  final List<OccupationDisease> _occupationDisease= [];
  List<OccupationDisease> _occupationDiseaseFiltered= [];
  int _page = 1;
  int _pageFiltered = 1;
  String _filter ="";
  final int _pageSize = 10;

  OccupationDiseaseBloc() : super(const OccupationDiseaseInitial(message: 'Hastalık bilgileri getiriliyor')) {

    on<GetOccupationDiseaseData>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        final occupationDiseaseResponse = await _occupationDiseaseRepository.getOccupationDiseaseData(page : _page,pageSize: _pageSize);
        _page = occupationDiseaseResponse.pageNumber+1;
        _occupationDisease.addAll(occupationDiseaseResponse.data);
        occupationDiseaseResponse.data = _occupationDisease;
        emit(OccupationDiseaseDataLoaded(occupationDiseaseResponse: occupationDiseaseResponse, isReachedMax: occupationDiseaseResponse.nextPage==null));
      }
      catch(e){
        emit(OccupationDiseaseDataError(message: "Hastalık bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<GetOccupationDiseaseFiltered>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        _filter!=event.filter ? _pageFiltered=1 : _pageFiltered;
        _filter!=event.filter ? _occupationDiseaseFiltered = [] : _occupationDiseaseFiltered;
        final occupationDiseaseResponseFiltered = await _occupationDiseaseRepository.getOccupationDiseaseFiltered(page: _pageFiltered,pageSize: _pageSize,filter: event.filter);
        _pageFiltered = occupationDiseaseResponseFiltered.pageNumber+1;
        _occupationDiseaseFiltered.addAll(occupationDiseaseResponseFiltered.data);
        occupationDiseaseResponseFiltered.data = _occupationDiseaseFiltered;
        _filter=event.filter;
        emit(OccupationDiseaseDataFiltered(occupationDiseaseResponse: occupationDiseaseResponseFiltered, filter: event.filter,isReachedMaxFiltered: occupationDiseaseResponseFiltered.nextPage==null));
      }
      catch(e){
        emit(OccupationDiseaseDataError(message: "Hastalık bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
    on<CreateNewOccupationDisease>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));

      }
      catch(e){
        emit(NewOccupationDiseaseCreationError(message: "Hastalık Eklenemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

  }
}

