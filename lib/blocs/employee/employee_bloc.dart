
import 'dart:convert';

import 'package:aeah_work_safety/blocs/auth/models/login_request.dart';
import 'package:aeah_work_safety/blocs/auth/models/login_response.dart';
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
      final employeeResponse = await _employeeRepository.getEmployeeData(page : event.page,pageSize: event.pageSize,employeeRequest: event.employeeRequest);
      final statisticResponse = await _statisticRepository.getGeneralStatistic(event.employeeRequest.loginResponse);
      if (employeeResponse.statusCode == 200 && statisticResponse.statusCode == 200) {
        final employeeResponseJson = jsonDecode(employeeResponse.body);
        final EmployeeResponse employeeResponseModel =EmployeeResponse.fromJson(employeeResponseJson);

        final statisticResponseJson = jsonDecode(statisticResponse.body);
        final DateTime lastAccidentDay = DateTime.parse(statisticResponseJson['dayOfLastAccident']);
        final int dayWithoutAccident = DateTime.now().difference(lastAccidentDay).inDays;
        statisticResponseJson['dayWithoutAccident'] = dayWithoutAccident;
        final statisticResponseModel = StatisticResponse.fromJson(statisticResponseJson);
        emit(EmployeeData(employeeResponse: employeeResponseModel, statisticResponse: statisticResponseModel));
      } else {
        emit(const EmployeeDataError(message: "Kullanıcı bilgileri getirilemedi"));
      }
    },
    );
/*    on<GetNextPageOfEmployeeData>((event, emit) async{
      final employeeResponse = await _employeeRepository.getEmployeeDataByPage(event.nextPage);
      final statisticResponse = await _statisticRepository.getGeneralStatistic(event.loginResponse);
      if (employeeResponse.statusCode == 200 && statisticResponse.statusCode == 200) {
        final employeeResponseJson = jsonDecode(employeeResponse.body);
        final EmployeeResponse employeeResponseModel =EmployeeResponse.fromJson(employeeResponseJson);

        final statisticResponseJson = jsonDecode(statisticResponse.body);
        final DateTime lastAccidentDay = DateTime.parse(statisticResponseJson['dayOfLastAccident']);
        final int dayWithoutAccident = DateTime.now().difference(lastAccidentDay).inDays;
        statisticResponseJson['dayWithoutAccident'] = dayWithoutAccident;
        final statisticResponseModel = StatisticResponse.fromJson(statisticResponseJson);
        emit(EmployeeData(employeeResponse: employeeResponseModel, statisticResponse: statisticResponseModel));
      } else {
        emit(const EmployeeDataError(message: "Kullanıcı bilgileri getirilemedi"));
      }
    } );*/
  }
}
