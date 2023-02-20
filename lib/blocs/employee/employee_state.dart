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
class EmployeeDataLoading extends EmployeeState{

  const EmployeeDataLoading();

  @override
  List<Object?> get props => [];
}

class EmployeeDataLoaded extends EmployeeState{
  final List<Employee> employeeResponse;
  final bool isReachedMax;

  const EmployeeDataLoaded({required this.employeeResponse,required this.isReachedMax});

  @override
  List<Object?> get props => [employeeResponse,isReachedMax];
}
class EmployeeDataFiltered extends EmployeeState{
  final String filter;
  final List<Employee>  employeeResponse;
  final bool isReachedMaxFiltered;

  const EmployeeDataFiltered({required this.employeeResponse,required this.isReachedMaxFiltered,required this.filter});

  @override
  List<Object?> get props => [employeeResponse, isReachedMaxFiltered];
}

class EmployeeDataError extends EmployeeState{
  final String message;

  const EmployeeDataError({required this.message});

  @override
  List<Object?> get props => [message];

}
