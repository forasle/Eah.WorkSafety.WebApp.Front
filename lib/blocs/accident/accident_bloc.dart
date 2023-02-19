import 'dart:async';

import 'package:aeah_work_safety/blocs/accident/models/accident.dart';
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
  List<Accident> _accident= [];
  List<Accident> _accidentFiltered= [];
  //int _page = 1;
  //int _pageFiltered = 1;
  //String _filter ="";
  static const String _pageSize = "10";
  var page = BaseAPI.accidentPath+"?pageNumber="+1.toString()+"&pageSize="+_pageSize;
  var pageFiltered = BaseAPI.accidentSearchPath+"?pageNumber="+1.toString()+"&pageSize="+_pageSize;

  AccidentBloc() : super(const AccidentInitial(message: 'Kaza bilgileri getiriliyor')) {
    on<GetAccidentData>((event, emit) async {
      try{
        if(event.needsRefresh==true){
          _accident = [];
          page = BaseAPI.accidentPath+"?pageNumber="+1.toString()+"&pageSize="+_pageSize;
        }
        //while(_accident.length>10){
        //  _accident.removeAt(0);
        //}
        await Future.delayed(const Duration(milliseconds: 500));
        final accidentResponse = await _accidentRepository.getAccidentData(page : page);
        if(accidentResponse.nextPage != null){
          page = accidentResponse.nextPage!;
        }
        else{
          emit(AccidentDataLoaded(accidentResponse: _accident, isReachedMax: accidentResponse.nextPage==null));
        }
        //_accident.addAll(accidentResponse.data);

        for(int i =0; i<accidentResponse.data.length;i++){
          if(_accident.contains(accidentResponse.data[i])){

          }
          else{
            _accident.add(accidentResponse.data[i]);
          }
        }

        emit(AccidentDataLoaded(accidentResponse: _accident, isReachedMax: accidentResponse.nextPage==null));
      }
      catch(e){
        emit(AccidentDataError(message: "Kaza bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<GetAccidentFiltered>((event, emit) async {
      try{
          if(event.needsRefresh==true){
            _accidentFiltered = [];
            pageFiltered = BaseAPI.accidentSearchPath+event.filter+"&pageNumber="+1.toString()+"&pageSize="+_pageSize;
          }

        await Future.delayed(const Duration(milliseconds: 500));
          final accidentResponseFiltered = await _accidentRepository.getAccidentFiltered(page : pageFiltered);
          if(accidentResponseFiltered .nextPage != null){
            page = accidentResponseFiltered .nextPage!;
          }
          else{
            emit(AccidentDataFiltered(accidentResponse: _accidentFiltered,filter: event.filter, isReachedMaxFiltered: accidentResponseFiltered.nextPage==null));
          }

          for(int i =0; i<accidentResponseFiltered.data.length;i++){
            if(_accidentFiltered.contains(accidentResponseFiltered.data[i])){

            }
            else{
              _accidentFiltered.add(accidentResponseFiltered.data[i]);
            }
          }
          emit(AccidentDataLoaded(accidentResponse: _accidentFiltered, isReachedMax: accidentResponseFiltered.nextPage==null));
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

