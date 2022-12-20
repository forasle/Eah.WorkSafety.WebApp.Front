import 'dart:convert';
import 'package:aeah_work_safety/blocs/auth/models/login_request.dart';
import 'package:aeah_work_safety/blocs/auth/models/login_response.dart';
import 'package:aeah_work_safety/blocs/auth/repository/auth_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = locator<AuthRepository>();

  AuthBloc() : super(const AuthInitState(message: "Lütfen kullanıcı adı ve şifrenizi giriniz")) {
    on<AuthSignInEvent>((event, emit) async {
      final authResponse = await _authRepository.signIn(loginRequest: event.loginRequest);
      if (authResponse.statusCode == 201) {
        final authResponseJson = jsonDecode(authResponse.body);
        final authResponseModel = LoginResponse.fromJson(authResponseJson);
        emit(AuthLoginSuccessState(loginResponse: authResponseModel));
      } else if (authResponse.statusCode == 400) {
        emit(const AuthLoginFailState(message: "Kullanıcı adı veya şifre yanlış"));
      } else {
        emit(const AuthLoginFailState(message: "Giriş yapılamadı"));
      }
    });
  }
}