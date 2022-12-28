part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class GetEmployeeData extends EmployeeEvent{

  const GetEmployeeData();

  @override
  List<Object> get props => [];
}

class GetEmployeeFiltered extends EmployeeEvent{
  final String filter;
  const GetEmployeeFiltered({required this.filter});

  @override
  List<Object> get props => [filter];
}
