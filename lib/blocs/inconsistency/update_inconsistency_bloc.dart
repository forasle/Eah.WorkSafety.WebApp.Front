import 'package:aeah_work_safety/blocs/inconsistency/models/update_inconsistency_model.dart';
import 'package:aeah_work_safety/blocs/inconsistency/repository/inconsistency_repository.dart';
import 'package:aeah_work_safety/services/jwt_decoder.dart';
import 'package:aeah_work_safety/constants/inconsistency/constants.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'update_inconsistency_event.dart';
part 'update_inconsistency_state.dart';

class UpdateInconsistencyBloc extends Bloc<UpdateInconsistencyEvent, UpdateInconsistencyState> {
  final InconsistencyRepository _inconsistencyRepository = locator<InconsistencyRepository>();
  UpdateInconsistencyBloc() : super(const UpdateInconsistencyInitial()) {
    on<UpdateInconsistency>((event, emit) async {
      const storage = FlutterSecureStorage();
      final String? token = await storage.read(key: "token");
      var user = parseJwt(token!);

      try {
        final UpdateInconsistencyModel _inconsistency;
        _inconsistency = UpdateInconsistencyModel(
            date: event.inconsistency["date"],
            referenceNumber: event.inconsistency["referenceNumber"],
            id: event.id,
            creatorUserId: int.parse(user["id"]),
            department: event.inconsistency["department"],
            information: event.inconsistency["information"],
            riskScore: int.parse(event.inconsistency["riskScore"]),
            rootCauseAnalysisRequirement: event.inconsistency["rootCauseAnalysisRequirement"],
            status: event.inconsistency["status"]);
        await _inconsistencyRepository.updateInconsistency(updatedInconsistency: _inconsistency);
        emit(const UpdateInconsistencyCompleted(message: "Uygunsuzluk Güncellendi"));
        emit(const UpdateInconsistencyInitial());
      } catch (e) {
        emit(UpdateInconsistencyError(message: "Uygunsuzluk güncellenemedi. Hata:  $e"));
      }
    });
  }
  List<bool> stringListToBoolList(List<String> firstStringList, List<String> secondStringList) {
    List<bool> boolList = secondStringList.map((e) => firstStringList.toSet().contains(e)).toList();
    return boolList;
  }
}
