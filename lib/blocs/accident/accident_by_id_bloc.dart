import 'dart:async';

import 'package:aeah_work_safety/blocs/accident/models/accident.dart';
import 'package:aeah_work_safety/blocs/accident/repository/accident_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'accident_by_id_event.dart';
part 'accident_by_id_state.dart';

class AccidentByIdBloc extends Bloc<AccidentByIdEvent, AccidentByIdState> {
  AccidentByIdBloc() : super(AccidentByIdInitial()) {
    final AccidentRepository _accidentRepository = locator<AccidentRepository>();
    on<GetAccidentDataById>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        final accident = await _accidentRepository.getAccidentDataById(id: event.id);
        emit(AccidentDataLoadedById(accident: accident));
      }
      catch(e){
        emit(AccidentByIdDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
    on<AccidentByIdInitialEvent>((event, emit) async {
      try{
        //await Future.delayed(const Duration(milliseconds: 500));
        print("initial");
        emit(AccidentByIdInitial());
      }
      catch(e){
        emit(AccidentByIdDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
  }
}
