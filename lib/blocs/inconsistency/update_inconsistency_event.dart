part of 'update_inconsistency_bloc.dart';

abstract class UpdateInconsistencyEvent extends Equatable {
  const UpdateInconsistencyEvent();

  @override
  List<Object> get props => [];
}

class UpdateInconsistency extends UpdateInconsistencyEvent{
  final Map<String, dynamic> inconsistency;
  final int id;
  const UpdateInconsistency({required this.inconsistency, required this.id});

  @override
  List<Object> get props => [inconsistency,id];
}
