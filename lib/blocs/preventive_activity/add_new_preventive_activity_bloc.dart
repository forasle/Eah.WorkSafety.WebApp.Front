import 'package:aeah_work_safety/blocs/preventive_activity/models/create_preventive_activity.dart';
import 'package:aeah_work_safety/blocs/preventive_activity/repository/preventive_activity_repository.dart';
import 'package:aeah_work_safety/services/jwt_decoder.dart';
import 'package:aeah_work_safety/constants/preventive_activities/constants.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
part 'add_new_preventive_activity_event.dart';
part 'add_new_preventive_activity_state.dart';

class AddNewPreventiveActivityBloc extends Bloc<AddNewPreventiveActivityEvent, AddNewPreventiveActivityState> {
  final PreventiveActivityRepository _preventiveActivityRepository = locator<PreventiveActivityRepository>();

  AddNewPreventiveActivityBloc() : super(const AddNewPreventiveActivityInitial()) {
    on<CreateNewPreventiveActivity>((event, emit) async {
      const storage = FlutterSecureStorage();
      final String? token = await storage.read(key: "token");
      var user = parseJwt(token!);


      try {
        final CreatePreventiveActivityModel _preventiveActivity;
        _preventiveActivity = CreatePreventiveActivityModel(
            date: event.preventiveActivity["date"],
            creationTime: DateTime.now(),
            deadline: event.preventiveActivity["deadline"],
            method: "Test",
            name: "Test",
            rootCauseAnalysis: event.preventiveActivity["rootCauseAnalysisRequirement"],
            referenceNumber: "Test",
            id: 0,
            creatorUserId: int.parse(user["id"]),
            information: event.preventiveActivity["information"],
            status: event.preventiveActivity["status"],
        );
        await _preventiveActivityRepository.createPreventiveActivity(newPreventiveActivity: _preventiveActivity);
        emit(const NewPreventiveActivityCreated(message: "DÖF Eklendi"));
        emit(const AddNewPreventiveActivityInitial());
      } catch (e) {
        emit(NewPreventiveActivityCreationError(message: "DÖF eklenemedi. Hata:  $e"));
      }
    });
  }
  List<bool> stringListToBoolList(List<String> firstStringList, List<String> secondStringList) {
    List<bool> boolList = secondStringList.map((e) => firstStringList.toSet().contains(e)).toList();
    return boolList;
  }
}
