part of 'inconsistency_by_id_bloc.dart';

abstract class InconsistencyByIdEvent extends Equatable {
  const InconsistencyByIdEvent();
  @override
  List<Object> get props => [];
}

class InconsistencyByIdInitialEvent extends InconsistencyByIdEvent{
  const InconsistencyByIdInitialEvent();

  @override
  List<Object> get props => [];
}

class GetInconsistencyDataById extends InconsistencyByIdEvent{
  final int id;
  const GetInconsistencyDataById({required this.id});

  @override
  List<Object> get props => [id];
}
