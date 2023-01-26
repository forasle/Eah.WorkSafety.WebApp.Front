import 'dart:async';
import 'package:aeah_work_safety/blocs/near_miss/models/near_miss.dart';
import 'package:aeah_work_safety/blocs/near_miss/models/near_miss_response.dart';
import 'package:aeah_work_safety/blocs/near_miss/repository/near_miss_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'near_miss_event.dart';
part 'near_miss_state.dart';

class NearMissBloc extends Bloc<NearMissEvent, NearMissState> {
  final NearMissRepository _nearMissRepository = locator<NearMissRepository>();
  final List<NearMiss> _nearMiss= [];
  List<NearMiss> _nearMissFiltered= [];
  int _page = 1;
  int _pageFiltered = 1;
  String _filter ="";
  final int _pageSize = 10;

  NearMissBloc() : super(const NearMissInitial(message: 'Ramak Kala bilgileri getiriliyor')) {

    on<GetNearMissData>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        final nearMissResponse = await _nearMissRepository.getNearMissData(page : _page,pageSize: _pageSize);
        _page = nearMissResponse.pageNumber+1;
        _nearMiss.addAll(nearMissResponse.data);
        nearMissResponse.data = _nearMiss;
        emit(NearMissDataLoaded(nearMissResponse: nearMissResponse, isReachedMax: nearMissResponse.nextPage==null));
      }
      catch(e){
        emit(NearMissDataError(message: "Ramak Kala bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<GetNearMissFiltered>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        _filter!=event.filter ? _pageFiltered=1 : _pageFiltered;
        _filter!=event.filter ? _nearMissFiltered = [] : _nearMissFiltered;
        final nearMissResponseFiltered = await _nearMissRepository.getNearMissFiltered(page: _pageFiltered,pageSize: _pageSize,filter: event.filter);
        _pageFiltered = nearMissResponseFiltered.pageNumber+1;
        _nearMissFiltered.addAll(nearMissResponseFiltered.data);
        nearMissResponseFiltered.data = _nearMissFiltered;
        _filter=event.filter;
        emit(NearMissDataFiltered(nearMissResponse: nearMissResponseFiltered, filter: event.filter,isReachedMaxFiltered: nearMissResponseFiltered.nextPage==null));
      }
      catch(e){
        emit(NearMissDataError(message: "Ramak Kala getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
    on<CreateNewNearMiss>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));

      }
      catch(e){
        emit(NewNearMissCreationError(message: "Ramak Kala Eklenemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

  }
}

