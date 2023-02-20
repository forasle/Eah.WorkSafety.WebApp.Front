part of 'employee_by_id_bloc.dart';

abstract class EmployeeByIdEvent extends Equatable {
  const EmployeeByIdEvent();
  @override
  List<Object> get props => [];
}

class EmployeeByIdInitialEvent extends EmployeeByIdEvent{
  const EmployeeByIdInitialEvent();

  @override
  List<Object> get props => [];
}

class GetEmployeeDataById extends EmployeeByIdEvent{
  final int id;
  const GetEmployeeDataById({required this.id});

  @override
  List<Object> get props => [id];
}
