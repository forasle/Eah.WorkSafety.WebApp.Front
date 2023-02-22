import 'dart:async';

import 'package:aeah_work_safety/blocs/inconsistency/repository/inconsistency_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_inconsistency_event.dart';
part 'delete_inconsistency_state.dart';

class DeleteInconsistencyBloc extends Bloc<DeleteInconsistencyEvent, DeleteInconsistencyState> {
  DeleteInconsistencyBloc() : super(DeleteInconsistencyInitial()) {
    on<DeleteInconsistency>((event, emit) async {
      final InconsistencyRepository _inconsistencyRepository = locator<InconsistencyRepository>();
      try {
        await _inconsistencyRepository.deleteInconsistency(id: event.id);
        emit(const DeleteInconsistencyCompleted(message: "Uygunsuzluk Silindi"));
      } catch (e) {
        emit(DeleteInconsistencyError(message: "Uygunsuzluk silinimedi. Hata:  $e"));
      }
    });
  }
}
