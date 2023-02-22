import 'dart:async';

import 'package:aeah_work_safety/blocs/preventive_activity/models/preventive_activity.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/repository/preventive_activity_repository.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'preventive_activity_event.dart';
part 'preventive_activity_state.dart';


class PreventiveActivityBloc extends Bloc<PreventiveActivityEvent, PreventiveActivityState> {
  final PreventiveActivityRepository _preventiveActivityRepository = locator<PreventiveActivityRepository>();
  List<PreventiveActivity> _preventiveActivity= [];
  List<PreventiveActivity> _preventiveActivityFiltered= [];
  //int _page = 1;
  //int _pageFiltered = 1;
  //String _filter ="";
  static const String _pageSize = "10";
  var page = BaseAPI.preventiveActivityPath+"?pageNumber="+1.toString()+"&pageSize="+_pageSize;
  var pageFiltered = BaseAPI.preventiveActivitySearchPath+"?pageNumber="+1.toString()+"&pageSize="+_pageSize;

  PreventiveActivityBloc() : super(const PreventiveActivityInitial(message: 'DÖF bilgileri getiriliyor')) {
    on<GetPreventiveActivityData>((event, emit) async {
      try{
        if(event.needsRefresh==true){
          _preventiveActivity = [];
          page = BaseAPI.preventiveActivityPath+"?pageNumber="+1.toString()+"&pageSize="+_pageSize;
        }
        //while(_preventiveActivity.length>10){
        //  _preventiveActivity.removeAt(0);
        //}
        await Future.delayed(const Duration(milliseconds: 500));
        final preventiveActivityResponse = await _preventiveActivityRepository.getPreventiveActivityData(page : page);
        if(preventiveActivityResponse.nextPage != null){
          page = preventiveActivityResponse.nextPage!;
        }
        else{
          emit(PreventiveActivityDataLoaded(preventiveActivityResponse: _preventiveActivity, isReachedMax: preventiveActivityResponse.nextPage==null));
        }
        //_preventiveActivity.addAll(preventiveActivityResponse.data);

        for(int i =0; i<preventiveActivityResponse.data.length;i++){
          if(_preventiveActivity.contains(preventiveActivityResponse.data[i])){

          }
          else{
            _preventiveActivity.add(preventiveActivityResponse.data[i]);
          }
          emit(PreventiveActivityDataLoaded(preventiveActivityResponse: _preventiveActivity, isReachedMax: preventiveActivityResponse.nextPage==null));
        }
        //emit(PreventiveActivityDataLoaded(preventiveActivityResponse: _preventiveActivity, isReachedMax: preventiveActivityResponse.nextPage==null));
      }
      catch(e){
        emit(PreventiveActivityDataError(message: "DÖF bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<GetPreventiveActivityFiltered>((event, emit) async {
      try{
        if(event.needsRefresh==true){
          _preventiveActivityFiltered = [];
          pageFiltered = BaseAPI.preventiveActivitySearchPath+event.filter+"&pageNumber="+1.toString()+"&pageSize="+_pageSize;
        }

        await Future.delayed(const Duration(milliseconds: 500));
        final preventiveActivityResponseFiltered = await _preventiveActivityRepository.getPreventiveActivityFiltered(page : pageFiltered);
        if(preventiveActivityResponseFiltered .nextPage != null){
          page = preventiveActivityResponseFiltered .nextPage!;
        }
        else{
          emit(PreventiveActivityDataLoaded(preventiveActivityResponse: _preventiveActivityFiltered, isReachedMax: preventiveActivityResponseFiltered.nextPage==null));
          //emit(PreventiveActivityDataFiltered(preventiveActivityResponse: _preventiveActivityFiltered,filter: event.filter, isReachedMaxFiltered: preventiveActivityResponseFiltered.nextPage==null));
        }

        for(int i =0; i<preventiveActivityResponseFiltered.data.length;i++){
          if(_preventiveActivityFiltered.contains(preventiveActivityResponseFiltered.data[i])){

          }
          else{
            _preventiveActivityFiltered.add(preventiveActivityResponseFiltered.data[i]);
          }
        }
        emit(PreventiveActivityDataLoaded(preventiveActivityResponse: _preventiveActivityFiltered, isReachedMax: preventiveActivityResponseFiltered.nextPage==null));
      }
      catch(e){
        emit(PreventiveActivityDataError(message: "DÖF bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<PreventiveActivityInitialEvent>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(const PreventiveActivityInitial(message: "DÖF Bilgileri Getiriliyor"));
    },
      transformer: droppable(),
    );

  }
}

