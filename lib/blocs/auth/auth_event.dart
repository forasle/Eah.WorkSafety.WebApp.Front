part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignInEvent extends AuthEvent {
  final LoginRequest loginRequest;

  const AuthSignInEvent({required this.loginRequest});

  @override
  List<Object> get props => [loginRequest];
}
