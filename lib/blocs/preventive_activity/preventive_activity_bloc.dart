import 'dart:async';

import 'package:aeah_work_safety/blocs/preventive_activity/models/preventive_activity.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/models/preventive_activity_response.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/repository/preventive_activity_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'preventive_activity_event.dart';
part 'preventive_activity_state.dart';


class PreventiveActivityBloc extends Bloc<PreventiveActivityEvent, PreventiveActivityState> {
  final PreventiveActivityRepository _preventiveActivityRepository = locator<PreventiveActivityRepository>();
  final List<PreventiveActivity> _preventiveActivity= [];
  List<PreventiveActivity> _preventiveActivityFiltered= [];
  int _page = 1;
  int _pageFiltered = 1;
  String _filter ="";
  final int _pageSize = 10;

  PreventiveActivityBloc() : super(const PreventiveActivityInitial(message: 'Bilgiler getiriliyor')) {

    on<GetPreventiveActivityData>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        final preventiveActivityResponse = await _preventiveActivityRepository.getPreventiveActivityData(page : _page,pageSize: _pageSize);
        _page = preventiveActivityResponse.pageNumber+1;
        _preventiveActivity.addAll(preventiveActivityResponse.data);
        preventiveActivityResponse.data = _preventiveActivity;
        emit(PreventiveActivityDataLoaded(preventiveActivityResponse: preventiveActivityResponse, isReachedMax: preventiveActivityResponse.nextPage==null));
      }
      catch(e){
        emit(PreventiveActivityDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<GetPreventiveActivityFiltered>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        _filter!=event.filter ? _pageFiltered=1 : _pageFiltered;
        _filter!=event.filter ? _preventiveActivityFiltered = [] : _preventiveActivityFiltered;
        final preventiveActivityResponseFiltered = await _preventiveActivityRepository.getPreventiveActivityFiltered(page: _pageFiltered,pageSize: _pageSize,filter: event.filter);
        _pageFiltered = preventiveActivityResponseFiltered.pageNumber+1;
        _preventiveActivityFiltered.addAll(preventiveActivityResponseFiltered.data);
        preventiveActivityResponseFiltered.data = _preventiveActivityFiltered;
        _filter=event.filter;
        emit(PreventiveActivityDataFiltered(preventiveActivityResponse: preventiveActivityResponseFiltered, filter: event.filter,isReachedMaxFiltered: preventiveActivityResponseFiltered.nextPage==null));
      }
      catch(e){
        emit(PreventiveActivityDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
    on<CreateNewPreventiveActivity>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));

      }
      catch(e){
        emit(NewPreventiveActivityCreationError(message: "Bilgiler Eklenemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

  }
}

