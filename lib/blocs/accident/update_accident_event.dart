part of 'update_accident_bloc.dart';

abstract class UpdateAccidentEvent extends Equatable {
  const UpdateAccidentEvent();

  @override
  List<Object> get props => [];
}

class UpdateAccident extends UpdateAccidentEvent{
  final Map<String, dynamic> accident;
  final int id;
  const UpdateAccident({required this.accident, required this.id});

  @override
  List<Object> get props => [accident,id];
}
