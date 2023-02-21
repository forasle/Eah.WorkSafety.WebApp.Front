import 'dart:async';

import 'package:aeah_work_safety/blocs/preventive_activity/models/preventive_activity.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/repository/preventive_activity_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';


part 'preventive_activity_by_id_event.dart';
part 'preventive_activity_by_id_state.dart';

class PreventiveActivityByIdBloc extends Bloc<PreventiveActivityByIdEvent, PreventiveActivityByIdState> {
  PreventiveActivityByIdBloc() : super(PreventiveActivityByIdInitial()) {
    final PreventiveActivityRepository _preventiveActivityRepository = locator<PreventiveActivityRepository>();
    on<GetPreventiveActivityDataById>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        final preventiveActivity = await _preventiveActivityRepository.getPreventiveActivityDataById(id: event.id);
        emit(PreventiveActivityDataLoadedById(preventiveActivity: preventiveActivity));
      }
      catch(e){
        emit(PreventiveActivityByIdDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
    on<PreventiveActivityByIdInitialEvent>((event, emit) async {
      try{
        //await Future.delayed(const Duration(milliseconds: 500));
        emit(PreventiveActivityByIdInitial());
      }
      catch(e){
        emit(PreventiveActivityByIdDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
  }
}
