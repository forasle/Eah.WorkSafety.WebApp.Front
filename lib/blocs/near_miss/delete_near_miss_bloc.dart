import 'dart:async';

import 'package:aeah_work_safety/blocs/near_miss/repository/near_miss_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_near_miss_event.dart';
part 'delete_near_miss_state.dart';

class DeleteNearMissBloc extends Bloc<DeleteNearMissEvent, DeleteNearMissState> {
  DeleteNearMissBloc() : super(DeleteNearMissInitial()) {
    on<DeleteNearMiss>((event, emit) async {
      final NearMissRepository _nearMissRepository = locator<NearMissRepository>();
      try {
        await _nearMissRepository.deleteNearMiss(id: event.id);
        emit(const DeleteNearMissCompleted(message: "Kaza Silindi"));
      } catch (e) {
        emit(DeleteNearMissError(message: "Kaza silinimedi. Hata:  $e"));
      }
    });
  }
}
