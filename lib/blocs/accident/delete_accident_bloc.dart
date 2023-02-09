import 'dart:async';

import 'package:aeah_work_safety/blocs/accident/repository/accident_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_accident_event.dart';
part 'delete_accident_state.dart';

class DeleteAccidentBloc extends Bloc<DeleteAccidentEvent, DeleteAccidentState> {
  DeleteAccidentBloc() : super(DeleteAccidentInitial()) {
    on<DeleteAccident>((event, emit) async {
      final AccidentRepository _accidentRepository = locator<AccidentRepository>();
      try {
        await _accidentRepository.deleteAccident(id: event.id);
        emit(const DeleteAccidentCompleted(message: "Kaza Silindi"));
      } catch (e) {
        emit(DeleteAccidentError(message: "Kaza silinimedi. Hata:  $e"));
      }
    });
  }
}
