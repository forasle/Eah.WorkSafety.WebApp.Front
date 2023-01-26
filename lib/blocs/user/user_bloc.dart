import 'dart:convert';
import 'package:aeah_work_safety/blocs/statistic/models/statistic_response.dart';
import 'package:aeah_work_safety/blocs/user/models/user_request.dart';
import 'package:aeah_work_safety/blocs/user/models/user_response.dart';
import 'package:aeah_work_safety/blocs/statistic/repository/statistic_repository.dart';
import 'package:aeah_work_safety/blocs/user/repository/user_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository = locator<UserRepository>();
  final StatisticRepository _statisticRepository = locator<StatisticRepository>();
  UserBloc() : super(const UserInitial(message: 'Kullanıcı bilgileri getiriliyor')) {
    on<GetUserData>((event, emit) async {
      try{
        final userResponse = await _userRepository.getUserData();
        final statisticResponse = await _statisticRepository.getGeneralStatistic();
        //userResponseJson['token'] = event.userRequest.loginResponse.token;
        emit(UserData(userResponse: userResponse, statisticResponse: statisticResponse));
      }
      catch(e){
        emit(const UserDataError(message: "Kullanıcı bilgileri getirilemedi"));
      }


    }

    );
  }
}
