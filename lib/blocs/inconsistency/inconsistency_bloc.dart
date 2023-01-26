import 'dart:async';

import 'package:aeah_work_safety/blocs/inconsistency/models/inconsistency.dart';
import 'package:aeah_work_safety/blocs/inconsistency/models/inconsistency_response.dart';
import 'package:aeah_work_safety/blocs/inconsistency/repository/inconsistency_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'inconsistency_event.dart';
part 'inconsistency_state.dart';

class InconsistencyBloc extends Bloc<InconsistencyEvent, InconsistencyState> {
  final InconsistencyRepository _inconsistencyRepository = locator<InconsistencyRepository>();
  final List<Inconsistency> _inconsistency= [];
  List<Inconsistency> _inconsistencyFiltered= [];
  int _page = 1;
  int _pageFiltered = 1;
  String _filter ="";
  final int _pageSize = 10;

  InconsistencyBloc() : super(const InconsistencyInitial(message: 'Bilgiler getiriliyor')) {

    on<GetInconsistencyData>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        final inconsistencyResponse = await _inconsistencyRepository.getInconsistencyData(page : _page,pageSize: _pageSize);
        _page = inconsistencyResponse.pageNumber+1;
        _inconsistency.addAll(inconsistencyResponse.data);
        inconsistencyResponse.data = _inconsistency;
        emit(InconsistencyDataLoaded(inconsistencyResponse: inconsistencyResponse, isReachedMax: inconsistencyResponse.nextPage==null));
      }
      catch(e){
        emit(InconsistencyDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<GetInconsistencyFiltered>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        _filter!=event.filter ? _pageFiltered=1 : _pageFiltered;
        _filter!=event.filter ? _inconsistencyFiltered = [] : _inconsistencyFiltered;
        final inconsistencyResponseFiltered = await _inconsistencyRepository.getInconsistencyFiltered(page: _pageFiltered,pageSize: _pageSize,filter: event.filter);
        _pageFiltered = inconsistencyResponseFiltered.pageNumber+1;
        _inconsistencyFiltered.addAll(inconsistencyResponseFiltered.data);
        inconsistencyResponseFiltered.data = _inconsistencyFiltered;
        _filter=event.filter;
        emit(InconsistencyDataFiltered(inconsistencyResponse: inconsistencyResponseFiltered, filter: event.filter,isReachedMaxFiltered: inconsistencyResponseFiltered.nextPage==null));
      }
      catch(e){
        emit(InconsistencyDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
    on<CreateNewInconsistency>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));

      }
      catch(e){
        emit(NewInconsistencyCreationError(message: "Bilgiler Eklenemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

  }
}


