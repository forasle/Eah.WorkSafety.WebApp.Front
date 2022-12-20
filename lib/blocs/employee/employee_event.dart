part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class GetEmployeeData extends EmployeeEvent{
  final EmployeeRequest employeeRequest;

  const GetEmployeeData({required this.employeeRequest});

  @override
  List<Object> get props => [employeeRequest];
}
