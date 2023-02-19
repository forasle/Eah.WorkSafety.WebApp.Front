part of 'accident_bloc.dart';

abstract class AccidentEvent extends Equatable {
  const AccidentEvent();

  @override
  List<Object> get props => [];
}

class AccidentInitialEvent extends AccidentEvent{
  const AccidentInitialEvent();
  @override
  List<Object> get props => [];
}

class GetAccidentData extends AccidentEvent{
  final bool needsRefresh;
  const GetAccidentData({required this.needsRefresh});

  @override
  List<Object> get props => [needsRefresh];
}

class GetAccidentFiltered extends AccidentEvent{
  final bool needsRefresh;
  final String filter;
  const GetAccidentFiltered({required this.filter,required this.needsRefresh});

  @override
  List<Object> get props => [filter,needsRefresh];
}