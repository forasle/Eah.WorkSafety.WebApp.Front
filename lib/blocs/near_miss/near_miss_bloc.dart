import 'dart:async';

import 'package:aeah_work_safety/blocs/near_miss/models/near_miss.dart';
import 'package:aeah_work_safety/blocs/near_miss/models/near_miss_response.dart';
import 'package:aeah_work_safety/blocs/near_miss/repository/near_miss_repository.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'near_miss_event.dart';
part 'near_miss_state.dart';

class NearMissBloc extends Bloc<NearMissEvent, NearMissState> {
  final NearMissRepository _nearMissRepository = locator<NearMissRepository>();
  List<NearMiss> _nearMiss= [];
  List<NearMiss> _nearMissFiltered= [];
  //int _page = 1;
  //int _pageFiltered = 1;
  //String _filter ="";
  final String _pageSize = "10";
  var page = BaseAPI.nearMissPath+"?pageNumber="+1.toString()+"&pageSize="+10.toString();
  var pageFiltered = BaseAPI.nearMissSearchPath+"?pageNumber="+1.toString()+"&pageSize="+10.toString();

  NearMissBloc() : super(const NearMissInitial(message: 'Kaza bilgileri getiriliyor')) {
    on<GetNearMissData>((event, emit) async {
      try{
        if(event.needsRefresh==true){
          _nearMiss = [];
          page = BaseAPI.nearMissPath+"?pageNumber="+1.toString()+"&pageSize="+10.toString();
        }
        //while(_nearMiss.length>10){
        //  _nearMiss.removeAt(0);
        //}
        await Future.delayed(const Duration(milliseconds: 500));
        final nearMissResponse = await _nearMissRepository.getNearMissData(page : page);
        if(nearMissResponse.nextPage != null){
          page = nearMissResponse.nextPage!;
        }
        else{
          emit(NearMissDataLoaded(nearMissResponse: _nearMiss, isReachedMax: nearMissResponse.nextPage==null));
        }
        //_nearMiss.addAll(nearMissResponse.data);

        for(int i =0; i<nearMissResponse.data.length;i++){
          if(_nearMiss.contains(nearMissResponse.data[i])){

          }
          else{
            _nearMiss.add(nearMissResponse.data[i]);
          }
        }

        emit(NearMissDataLoaded(nearMissResponse: _nearMiss, isReachedMax: nearMissResponse.nextPage==null));
      }
      catch(e){
        emit(NearMissDataError(message: "Kaza bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<GetNearMissFiltered>((event, emit) async {
      try{
        if(event.needsRefresh==true){
          _nearMissFiltered = [];
          pageFiltered = BaseAPI.nearMissSearchPath+event.filter+"&pageNumber="+1.toString()+"&pageSize="+_pageSize;
        }
        await Future.delayed(const Duration(milliseconds: 500));
        final nearMissResponseFiltered = await _nearMissRepository.getNearMissFiltered(page : pageFiltered, filter: event.filter);
        if(nearMissResponseFiltered .nextPage != null){
          page = nearMissResponseFiltered .nextPage!;
        }
        else{
          emit(NearMissDataFiltered(nearMissResponse: _nearMissFiltered,filter: event.filter, isReachedMaxFiltered: nearMissResponseFiltered.nextPage==null));
        }

        for(int i =0; i<nearMissResponseFiltered.data.length;i++){
          if(_nearMissFiltered.contains(nearMissResponseFiltered.data[i])){

          }
          else{
            _nearMissFiltered.add(nearMissResponseFiltered.data[i]);
          }
        }
        emit(NearMissDataLoaded(nearMissResponse: _nearMissFiltered, isReachedMax: nearMissResponseFiltered.nextPage==null));
      }
      catch(e){
        emit(NearMissDataError(message: "Kaza bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<NearMissInitialEvent>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(const NearMissInitial(message: "Kaza Bilgileri Getiriliyor"));
    },
      transformer: droppable(),
    );

  }
}

