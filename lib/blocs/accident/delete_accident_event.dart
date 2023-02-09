part of 'delete_accident_bloc.dart';

abstract class DeleteAccidentEvent extends Equatable {
  const DeleteAccidentEvent();
}

class DeleteAccident extends DeleteAccidentEvent{
  final int id;
  const DeleteAccident({required this.id});

  @override
  List<Object> get props => [id];
}
