part of 'update_accident_bloc.dart';

abstract class UpdateAccidentState extends Equatable {
  const UpdateAccidentState();
}

class UpdateAccidentInitial extends UpdateAccidentState {
  @override
  List<Object> get props => [];

  const UpdateAccidentInitial();
}

class UpdateAccidentCompleted extends UpdateAccidentState{
  final String message;

  const UpdateAccidentCompleted({required this.message});

  @override
  List<Object?> get props => [message];

}
class UpdateAccidentError extends UpdateAccidentState{
  final String message;

  const UpdateAccidentError({required this.message});

  @override
  List<Object?> get props => [message];

}
