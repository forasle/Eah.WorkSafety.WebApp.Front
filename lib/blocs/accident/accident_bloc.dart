import 'dart:async';

import 'package:aeah_work_safety/blocs/accident/models/accident.dart';
import 'package:aeah_work_safety/blocs/accident/models/accident_response.dart';
import 'package:aeah_work_safety/blocs/accident/repository/accident_repository.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'accident_event.dart';
part 'accident_state.dart';

class AccidentBloc extends Bloc<AccidentEvent, AccidentState> {
  final AccidentRepository _accidentRepository = locator<AccidentRepository>();
  final List<Accident> _accident= [];
  List<Accident> _accidentFiltered= [];
  //int _page = 1;
  int _pageFiltered = 1;
  String _filter ="";
  final int _pageSize = 10;
  var page = BaseAPI.accidentPath+"?pageNumber="+1.toString()+"&pageSize="+10.toString();
  var pageFiltered = BaseAPI.accidentSearchPath+"?pageNumber="+1.toString()+"&pageSize="+10.toString();

  AccidentBloc() : super(const AccidentInitial(message: 'Kaza bilgileri getiriliyor')) {
    on<GetAccidentData>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        final accidentResponse = await _accidentRepository.getAccidentData(page : page);
        if(accidentResponse.nextPage != null){
          page = accidentResponse.nextPage!;
        }
        /*
        for(int i =0; i<accidentResponse.data.length;i++){
          if(_accident.contains(accidentResponse.data[i])){

          }
          else{
            _accident.add(accidentResponse.data[i]);
          }
        }

        accidentResponse.data = _accident;*/
        emit(AccidentDataLoaded(accidentResponse: accidentResponse, isReachedMax: accidentResponse.nextPage==null));
      }
      catch(e){
        emit(AccidentDataError(message: "Kaza bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<GetAccidentFiltered>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        _filter!=event.filter ? _pageFiltered=1 : _pageFiltered;
        _filter!=event.filter ? _accidentFiltered = [] : _accidentFiltered;
        final accidentResponseFiltered = await _accidentRepository.getAccidentFiltered(page: _pageFiltered,pageSize: _pageSize,filter: event.filter);
        _pageFiltered = accidentResponseFiltered.pageNumber+1;
        _accidentFiltered.addAll(accidentResponseFiltered.data);
        accidentResponseFiltered.data = _accidentFiltered;
        _filter=event.filter;
        emit(AccidentDataFiltered(accidentResponse: accidentResponseFiltered, filter: event.filter,isReachedMaxFiltered: accidentResponseFiltered.nextPage==null));
      }
      catch(e){
        emit(AccidentDataError(message: "Kaza bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<AccidentInitialEvent>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(const AccidentInitial(message: "Kaza Bilgileri Getiriliyor"));
    },
      transformer: droppable(),
    );

  }
}

