
import 'package:aeah_work_safety/blocs/preventive_activity/repository/preventive_activity_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_preventive_activity_event.dart';
part 'delete_preventive_activity_state.dart';

class DeletePreventiveActivityBloc extends Bloc<DeletePreventiveActivityEvent, DeletePreventiveActivityState> {
  DeletePreventiveActivityBloc() : super(DeletePreventiveActivityInitial()) {
    on<DeletePreventiveActivity>((event, emit) async {
      final PreventiveActivityRepository _preventiveActivityRepository = locator<PreventiveActivityRepository>();
      try {
        await _preventiveActivityRepository.deletePreventiveActivity(id: event.id);
        emit(const DeletePreventiveActivityCompleted(message: "DÖF Silindi"));
      } catch (e) {
        emit(DeletePreventiveActivityError(message: "DÖF silinimedi. Hata:  $e"));
      }
    });
  }
}
