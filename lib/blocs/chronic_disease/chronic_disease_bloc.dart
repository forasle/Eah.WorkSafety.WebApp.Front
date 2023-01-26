import 'dart:async';

import 'package:aeah_work_safety/blocs/chronic_disease/models/chronic_disease.dart';
import 'package:aeah_work_safety/blocs/chronic_disease/models/chronic_disease_response.dart';
import 'package:aeah_work_safety/blocs/chronic_disease/repository/chronic_disease_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'chronic_disease_event.dart';
part 'chronic_disease_state.dart';


class ChronicDiseaseBloc extends Bloc<ChronicDiseaseEvent, ChronicDiseaseState> {
  final ChronicDiseaseRepository _chronicDiseaseRepository = locator<ChronicDiseaseRepository>();
  final List<ChronicDisease> _chronicDisease= [];
  List<ChronicDisease> _chronicDiseaseFiltered= [];
  int _page = 1;
  int _pageFiltered = 1;
  String _filter ="";
  final int _pageSize = 10;

  ChronicDiseaseBloc() : super(const ChronicDiseaseInitial(message: 'Hastalık bilgileri getiriliyor')) {

    on<GetChronicDiseaseData>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        final chronicDiseaseResponse = await _chronicDiseaseRepository.getChronicDiseaseData(page : _page,pageSize: _pageSize);
        _page = chronicDiseaseResponse.pageNumber+1;
        _chronicDisease.addAll(chronicDiseaseResponse.data);
        chronicDiseaseResponse.data = _chronicDisease;
        emit(ChronicDiseaseDataLoaded(chronicDiseaseResponse: chronicDiseaseResponse, isReachedMax: chronicDiseaseResponse.nextPage==null));
      }
      catch(e){
        emit(ChronicDiseaseDataError(message: "Hastalık bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<GetChronicDiseaseFiltered>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        _filter!=event.filter ? _pageFiltered=1 : _pageFiltered;
        _filter!=event.filter ? _chronicDiseaseFiltered = [] : _chronicDiseaseFiltered;
        final chronicDiseaseResponseFiltered = await _chronicDiseaseRepository.getChronicDiseaseFiltered(page: _pageFiltered,pageSize: _pageSize,filter: event.filter);
        _pageFiltered = chronicDiseaseResponseFiltered.pageNumber+1;
        _chronicDiseaseFiltered.addAll(chronicDiseaseResponseFiltered.data);
        chronicDiseaseResponseFiltered.data = _chronicDiseaseFiltered;
        _filter=event.filter;
        emit(ChronicDiseaseDataFiltered(chronicDiseaseResponse: chronicDiseaseResponseFiltered, filter: event.filter,isReachedMaxFiltered: chronicDiseaseResponseFiltered.nextPage==null));
      }
      catch(e){
        emit(ChronicDiseaseDataError(message: "Hastalık bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
    on<CreateNewChronicDisease>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));

      }
      catch(e){
        emit(NewChronicDiseaseCreationError(message: "Hastalık Eklenemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

  }
}

