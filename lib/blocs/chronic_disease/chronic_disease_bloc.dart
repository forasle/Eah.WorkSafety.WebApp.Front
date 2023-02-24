import 'dart:async';

import 'package:aeah_work_safety/blocs/chronic_disease/models/chronic_disease.dart';
import 'package:aeah_work_safety/blocs/chronic_disease/repository/chronic_disease_repository.dart';
import 'package:aeah_work_safety/blocs/employee/employee_by_id_bloc.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/blocs/employee/repository/employee_repository.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'chronic_disease_event.dart';
part 'chronic_disease_state.dart';

class ChronicDiseaseBloc extends Bloc<ChronicDiseaseEvent, ChronicDiseaseState> {
  final ChronicDiseaseRepository _chronicDiseaseRepository = locator<ChronicDiseaseRepository>();
  //final EmployeeRepository _employeeRepository = locator<EmployeeRepository>();
  //List<Employee> _employee= [];
  //List<Employee> _employeeFiltered= [];
  static const String _pageSize = "10";
  //var page = BaseAPI.employeePath+"?pageNumber="+1.toString()+"&pageSize="+_pageSize;
  //var pageFiltered = BaseAPI.employeeSearchPath+"?pageNumber="+1.toString()+"&pageSize="+_pageSize;

  List<ChronicDisease> _chronicDisease= [];
  List<ChronicDisease> _chronicDiseaseFiltered= [];
  var page = BaseAPI.chronicDiseasePath+"?pageNumber="+1.toString()+"&pageSize="+_pageSize;
  var pageFiltered = BaseAPI.chronicDiseaseSearchPath+"?pageNumber="+1.toString()+"&pageSize="+_pageSize;

  ChronicDiseaseBloc() : super(const ChronicDiseaseInitial(message: 'Hastalık bilgileri getiriliyor')) {
    on<GetChronicDiseaseData>((event, emit) async {
      try{
        if(event.needsRefresh==true){
          _chronicDisease = [];
          page = BaseAPI.chronicDiseasePath+"?pageNumber="+1.toString()+"&pageSize="+_pageSize;
        }
        //while(_chronicDisease.length>10){
        //  _chronicDisease.removeAt(0);
        //}
        await Future.delayed(const Duration(milliseconds: 500));
        final chronicDiseaseResponse = await _chronicDiseaseRepository.getChronicDiseaseData(page : page);

        if(chronicDiseaseResponse.nextPage != null){
          page = chronicDiseaseResponse.nextPage!;
        }

        else{
          emit(ChronicDiseaseDataLoaded(chronicDiseaseResponse: _chronicDisease, isReachedMax: chronicDiseaseResponse.nextPage==null));
        }
        //_chronicDisease.addAll(chronicDiseaseResponse.data);

        for(int i =0; i<chronicDiseaseResponse.data.length;i++){
          if(_chronicDisease.contains(chronicDiseaseResponse.data[i])){

          }
          else{
            _chronicDisease.add(chronicDiseaseResponse.data[i]);
          }
          emit(ChronicDiseaseDataLoaded(chronicDiseaseResponse: _chronicDisease, isReachedMax: chronicDiseaseResponse.nextPage==null));
        }
        //emit(ChronicDiseaseDataLoaded(chronicDiseaseResponse: _chronicDisease, isReachedMax: chronicDiseaseResponse.nextPage==null));
      }
      catch(e){
        emit(ChronicDiseaseDataError(message: "Hastalık bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<GetChronicDiseaseFiltered>((event, emit) async {
      try{
          if(event.needsRefresh==true){
            _chronicDiseaseFiltered = [];
            pageFiltered = BaseAPI.chronicDiseaseSearchPath+event.filter+"&pageNumber="+1.toString()+"&pageSize="+_pageSize;
          }

        await Future.delayed(const Duration(milliseconds: 500));
          final chronicDiseaseResponseFiltered = await _chronicDiseaseRepository.getChronicDiseaseFiltered(page : pageFiltered);
          if(chronicDiseaseResponseFiltered .nextPage != null){
            page = chronicDiseaseResponseFiltered .nextPage!;
          }
          else{
            emit(ChronicDiseaseDataLoaded(chronicDiseaseResponse: _chronicDiseaseFiltered, isReachedMax: chronicDiseaseResponseFiltered.nextPage==null));
            //emit(ChronicDiseaseDataFiltered(chronicDiseaseResponse: _chronicDiseaseFiltered,filter: event.filter, isReachedMaxFiltered: chronicDiseaseResponseFiltered.nextPage==null));
          }

          for(int i =0; i<chronicDiseaseResponseFiltered.data.length;i++){
            if(_chronicDiseaseFiltered.contains(chronicDiseaseResponseFiltered.data[i])){

            }
            else{
              _chronicDiseaseFiltered.add(chronicDiseaseResponseFiltered.data[i]);
            }
          }
          emit(ChronicDiseaseDataLoaded(chronicDiseaseResponse: _chronicDiseaseFiltered, isReachedMax: chronicDiseaseResponseFiltered.nextPage==null));
      }
      catch(e){
        emit(ChronicDiseaseDataError(message: "Hastalık bilgileri getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<ChronicDiseaseInitialEvent>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(const ChronicDiseaseInitial(message: "Hastalık Bilgileri Getiriliyor"));
    },
      transformer: droppable(),
    );

  }
}

