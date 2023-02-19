import 'dart:async';

import 'package:aeah_work_safety/blocs/near_miss/models/near_miss.dart';
import 'package:aeah_work_safety/blocs/near_miss/repository/near_miss_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'near_miss_by_id_event.dart';
part 'near_miss_by_id_state.dart';

class NearMissByIdBloc extends Bloc<NearMissByIdEvent, NearMissByIdState> {
  NearMissByIdBloc() : super(NearMissByIdInitial()) {
    final NearMissRepository _nearMissRepository = locator<NearMissRepository>();
    on<GetNearMissDataById>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        final nearMiss = await _nearMissRepository.getNearMissDataById(id: event.id);
        emit(NearMissDataLoadedById(nearMiss: nearMiss));
      }
      catch(e){
        emit(NearMissByIdDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
    on<NearMissByIdInitialEvent>((event, emit) async {
      try{
        //await Future.delayed(const Duration(milliseconds: 500));
        print("initial");
        emit(NearMissByIdInitial());
      }
      catch(e){
        emit(NearMissByIdDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
  }
}
