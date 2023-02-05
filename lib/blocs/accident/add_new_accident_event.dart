part of 'add_new_accident_bloc.dart';

abstract class AddNewAccidentEvent extends Equatable {
  const AddNewAccidentEvent();
  @override
  List<Object> get props => [];
}

class CreateNewAccident extends AddNewAccidentEvent{
  final Map<String, dynamic> accident;
  const CreateNewAccident({required this.accident});

  @override
  List<Object> get props => [accident];
}