import 'dart:convert';

import 'package:aeah_work_safety/blocs/user/models/employee_response.dart';
import 'package:aeah_work_safety/blocs/user/models/statistic_response.dart';
import 'package:aeah_work_safety/blocs/user/models/user_request.dart';
import 'package:aeah_work_safety/blocs/user/models/user_response.dart';
import 'package:aeah_work_safety/blocs/user/network/statistic_service.dart';
import 'package:aeah_work_safety/blocs/user/repository/employee_repository.dart';
import 'package:aeah_work_safety/blocs/user/repository/statistic_repository.dart';
import 'package:aeah_work_safety/blocs/user/repository/user_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:aeah_work_safety/widgets/day_without_accident_page/day_without_accident.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository = locator<UserRepository>();
  final EmployeeRepository _employeeRepository = locator<EmployeeRepository>();
  final StatisticRepository _statisticRepository = locator<StatisticRepository>();
  UserBloc() : super(const UserInitial(message: 'User bilgileri getirilecek')) {
    on<GetUserData>((event, emit) async {
      final userResponse = await _userRepository.getUserData(userRequest: event.userRequest);
      final employeeResponse = await _employeeRepository.getEmployeeCount();
      final statisticResponse = await _statisticRepository.getGeneralStatistic();
      if (userResponse.statusCode == 200 && statisticResponse.statusCode == 200) {
        final userResponseJson = jsonDecode(userResponse.body);
        userResponseJson['token'] = event.userRequest.loginResponse.token;
        final userResponseModel = UserResponse.fromJson(userResponseJson);

        final statisticResponseJson = jsonDecode(statisticResponse.body);
        final DateTime lastAccidentDay = DateTime.parse(statisticResponseJson['lastAccidentDate']);
        final int dayWithoutAccident = DateTime.now().difference(lastAccidentDay).inDays;
        statisticResponseJson['dayWithoutAccident'] = dayWithoutAccident;
        final statisticResponseModel = StatisticResponse.fromJson(statisticResponseJson);
        emit(UserData(userResponse: userResponseModel, statisticResponse: statisticResponseModel));
      } else {
        emit(const UserDataError(message: "Kullanıcı bilgileri getirilemedi"));
      }
    });
  }
}
