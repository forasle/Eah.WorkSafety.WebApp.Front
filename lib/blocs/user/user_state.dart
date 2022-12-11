part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  final String message;
  const UserInitial({required this.message});

  @override
  List<Object?> get props => [message];
}

class UserData extends UserState{
  final UserResponse userResponse;
  final StatisticResponse statisticResponse;

  const UserData({required this.statisticResponse, required this.userResponse});

  @override
  List<Object?> get props => [userResponse];
}
class UserDataError extends UserState{
  final String message;

  const UserDataError({required this.message});

  @override
  List<Object?> get props => [message];

}
