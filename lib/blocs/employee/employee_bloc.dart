import 'package:aeah_work_safety/blocs/employee/models/employee_request.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/blocs/employee/repository/employee_repository.dart';
import 'package:aeah_work_safety/blocs/user/models/statistic_response.dart';
import 'package:aeah_work_safety/blocs/user/repository/statistic_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository _employeeRepository = locator<EmployeeRepository>();
  final StatisticRepository _statisticRepository = locator<StatisticRepository>();
  EmployeeBloc() : super(const EmployeeInitial(message: 'Çalışan bilgileri getiriliyor')) {
    on<GetEmployeeData>((event, emit) async {
      final employeeResponse = await _employeeRepository.getEmployeeData(page : event.page,pageSize: event.pageSize);
      final statisticResponse = await _statisticRepository.getGeneralStatistic();
      if (employeeResponse.succeeded) {
        emit(EmployeeData(employeeResponse: employeeResponse, statisticResponse: statisticResponse));
      } else {
        emit(const EmployeeDataError(message: "Kullanıcı bilgileri getirilemedi"));
      }
    },
    );
  }
}
