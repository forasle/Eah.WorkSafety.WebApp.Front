part of 'delete_accident_bloc.dart';

abstract class DeleteAccidentState extends Equatable {
  const DeleteAccidentState();
}

class DeleteAccidentInitial extends DeleteAccidentState {
  @override
  List<Object> get props => [];
}

class DeleteAccidentCompleted extends DeleteAccidentState{
  final String message;

  const DeleteAccidentCompleted({required this.message});

  @override
  List<Object?> get props => [message];

}
class DeleteAccidentError extends DeleteAccidentState{
  final String message;

  const DeleteAccidentError({required this.message});

  @override
  List<Object?> get props => [message];

}

