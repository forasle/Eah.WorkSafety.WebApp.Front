part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object> get props => [];
}

class GetUserData extends UserEvent{
  final UserRequest userRequest;

  const GetUserData({required this.userRequest});

  @override
  List<Object> get props => [userRequest];
}
