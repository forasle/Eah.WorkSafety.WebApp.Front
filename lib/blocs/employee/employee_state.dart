part of 'employee_bloc.dart';
abstract class EmployeeState extends Equatable {
  const EmployeeState();
}

class EmployeeInitial extends EmployeeState {
  final String message;
  const EmployeeInitial({required this.message});

  @override
  List<Object?> get props => [message];
}

class EmployeeData extends EmployeeState{
  final List<EmployeeResponse> employeeResponse;
  final StatisticResponse statisticResponse;

  const EmployeeData({required this.statisticResponse, required this.employeeResponse});

  @override
  List<Object?> get props => [employeeResponse];
}
class EmployeeDataError extends EmployeeState{
  final String message;

  const EmployeeDataError({required this.message});

  @override
  List<Object?> get props => [message];

}
