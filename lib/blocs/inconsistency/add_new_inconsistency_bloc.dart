import 'package:aeah_work_safety/blocs/inconsistency/models/create_inconsistency_model.dart';
import 'package:aeah_work_safety/blocs/inconsistency/repository/inconsistency_repository.dart';
import 'package:aeah_work_safety/constants/inconsistency/constants.dart';
import 'package:aeah_work_safety/services/jwt_decoder.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
part 'add_new_inconsistency_event.dart';
part 'add_new_inconsistency_state.dart';

class AddNewInconsistencyBloc extends Bloc<AddNewInconsistencyEvent, AddNewInconsistencyState> {
  final InconsistencyRepository _inconsistencyRepository = locator<InconsistencyRepository>();

  AddNewInconsistencyBloc() : super(const AddNewInconsistencyInitial()) {
    on<CreateNewInconsistency>((event, emit) async {
      const storage = FlutterSecureStorage();
      final String? token = await storage.read(key: "token");
      var user = parseJwt(token!);

      try {
        final CreateInconsistencyModel _inconsistency;
        _inconsistency = CreateInconsistencyModel(
          date: event.inconsistency["date"],
          referenceNumber: event.inconsistency["referenceNumber"],
          id: 0,
          creatorUserId: int.parse(user["id"]),
          department: event.inconsistency["department"],
          information: event.inconsistency["information"],
          riskScore: int.parse(event.inconsistency["riskScore"]),
          rootCauseAnalysisRequirement: event.inconsistency["rootCauseAnalysisRequirement"],
          status: event.inconsistency["status"]

        );
        await _inconsistencyRepository.createInconsistency(newInconsistency: _inconsistency);
        emit(const NewInconsistencyCreated(message: "Uygunsuzluk Eklendi"));
        emit(const AddNewInconsistencyInitial());
      } catch (e) {
        emit(NewInconsistencyCreationError(message: "Uygunsuzluk eklenemedi. Hata:  $e"));
      }
    });
  }
  List<bool> stringListToBoolList(List<String> firstStringList, List<String> secondStringList) {
    List<bool> boolList = secondStringList.map((e) => firstStringList.toSet().contains(e)).toList();
    return boolList;
  }
}
