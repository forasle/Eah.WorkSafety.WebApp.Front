part of 'delete_inconsistency_bloc.dart';

abstract class DeleteInconsistencyEvent extends Equatable {
  const DeleteInconsistencyEvent();
}

class DeleteInconsistency extends DeleteInconsistencyEvent{
  final int id;
  const DeleteInconsistency({required this.id});

  @override
  List<Object> get props => [id];
}
