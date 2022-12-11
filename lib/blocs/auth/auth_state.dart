part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitState extends AuthState {
  final String message;

  const AuthInitState({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthLoginSuccessState extends AuthState {
  final LoginResponse loginResponse;

  const AuthLoginSuccessState({required this.loginResponse});

  @override
  List<Object> get props => [loginResponse];
}

class AuthLoginFailState extends AuthState {
  final String message;

  const AuthLoginFailState({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthLoginServerFailState extends AuthState {
  final String message;

  const AuthLoginServerFailState({required this.message});

  @override
  List<Object> get props => [message];
}
