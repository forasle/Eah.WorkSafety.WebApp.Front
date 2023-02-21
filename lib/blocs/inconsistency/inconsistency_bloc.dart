import 'dart:async';

import 'package:aeah_work_safety/blocs/inconsistency/models/inconsistency.dart';
import 'package:aeah_work_safety/blocs/inconsistency/repository/inconsistency_repository.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'inconsistency_event.dart';
part 'inconsistency_state.dart';

class InconsistencyBloc extends Bloc<InconsistencyEvent, InconsistencyState> {
  final InconsistencyRepository _inconsistencyRepository = locator<InconsistencyRepository>();
  List<Inconsistency> _inconsistency= [];
  List<Inconsistency> _inconsistencyFiltered= [];
  //int _page = 1;
  //int _pageFiltered = 1;
  //String _filter ="";
  static const String _pageSize = "10";
  var page = BaseAPI.inconsistencyPath+"?pageNumber="+1.toString()+"&pageSize="+_pageSize;
  var pageFiltered = BaseAPI.inconsistencySearchPath+"?pageNumber="+1.toString()+"&pageSize="+_pageSize;

  InconsistencyBloc() : super(const InconsistencyInitial(message: 'Kaza bilgileri getiriliyor')) {
    on<GetInconsistencyData>((event, emit) async {
      try{
        if(event.needsRefresh==true){
          _inconsistency = [];
          page = BaseAPI.inconsistencyPath+"?pageNumber="+1.toString()+"&pageSize="+_pageSize;
        }
        //while(_inconsistency.length>10){
        //  _inconsistency.removeAt(0);
        //}
        await Future.delayed(const Duration(milliseconds: 500));
        final inconsistencyResponse = await _inconsistencyRepository.getInconsistencyData(page : page);
        if(inconsistencyResponse.nextPage != null){
          page = inconsistencyResponse.nextPage!;
        }
        else{
          emit(InconsistencyDataLoaded(inconsistencyResponse: _inconsistency, isReachedMax: inconsistencyResponse.nextPage==null));
        }
        //_inconsistency.addAll(inconsistencyResponse.data);

        for(int i =0; i<inconsistencyResponse.data.length;i++){
          if(_inconsistency.contains(inconsistencyResponse.data[i])){

          }
          else{
            _inconsistency.add(inconsistencyResponse.data[i]);
          }
          emit(InconsistencyDataLoaded(inconsistencyResponse: _inconsistency, isReachedMax: inconsistencyResponse.nextPage==null));
        }
        //emit(InconsistencyDataLoaded(inconsistencyResponse: _inconsistency, isReachedMax: inconsistencyResponse.nextPage==null));
      }
      catch(e){
        emit(InconsistencyDataError(message: "Kaza bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<GetInconsistencyFiltered>((event, emit) async {
      try{
          if(event.needsRefresh==true){
            _inconsistencyFiltered = [];
            pageFiltered = BaseAPI.inconsistencySearchPath+event.filter+"&pageNumber="+1.toString()+"&pageSize="+_pageSize;
          }

        await Future.delayed(const Duration(milliseconds: 500));
          final inconsistencyResponseFiltered = await _inconsistencyRepository.getInconsistencyFiltered(page : pageFiltered);
          if(inconsistencyResponseFiltered .nextPage != null){
            page = inconsistencyResponseFiltered .nextPage!;
          }
          else{
            emit(InconsistencyDataLoaded(inconsistencyResponse: _inconsistencyFiltered, isReachedMax: inconsistencyResponseFiltered.nextPage==null));
            //emit(InconsistencyDataFiltered(inconsistencyResponse: _inconsistencyFiltered,filter: event.filter, isReachedMaxFiltered: inconsistencyResponseFiltered.nextPage==null));
          }

          for(int i =0; i<inconsistencyResponseFiltered.data.length;i++){
            if(_inconsistencyFiltered.contains(inconsistencyResponseFiltered.data[i])){

            }
            else{
              _inconsistencyFiltered.add(inconsistencyResponseFiltered.data[i]);
            }
          }
          emit(InconsistencyDataLoaded(inconsistencyResponse: _inconsistencyFiltered, isReachedMax: inconsistencyResponseFiltered.nextPage==null));
      }
      catch(e){
        emit(InconsistencyDataError(message: "Kaza bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<InconsistencyInitialEvent>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(const InconsistencyInitial(message: "Kaza Bilgileri Getiriliyor"));
    },
      transformer: droppable(),
    );

  }
}

