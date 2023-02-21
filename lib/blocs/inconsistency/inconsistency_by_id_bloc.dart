import 'dart:async';

import 'package:aeah_work_safety/blocs/inconsistency/models/inconsistency.dart';
import 'package:aeah_work_safety/blocs/inconsistency/repository/inconsistency_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'inconsistency_by_id_event.dart';
part 'inconsistency_by_id_state.dart';

class InconsistencyByIdBloc extends Bloc<InconsistencyByIdEvent, InconsistencyByIdState> {
  InconsistencyByIdBloc() : super(InconsistencyByIdInitial()) {
    final InconsistencyRepository _inconsistencyRepository = locator<InconsistencyRepository>();
    on<GetInconsistencyDataById>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        final inconsistency = await _inconsistencyRepository.getInconsistencyDataById(id: event.id);
        emit(InconsistencyDataLoadedById(inconsistency: inconsistency));
      }
      catch(e){
        emit(InconsistencyByIdDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
    on<InconsistencyByIdInitialEvent>((event, emit) async {
      try{
        //await Future.delayed(const Duration(milliseconds: 500));
        emit(InconsistencyByIdInitial());
      }
      catch(e){
        emit(InconsistencyByIdDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
  }
}
