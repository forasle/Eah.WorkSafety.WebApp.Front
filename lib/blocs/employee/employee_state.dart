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
  final EmployeeResponse employeeResponse;
  final StatisticResponse statisticResponse;
  final bool isReachedMax;

  const EmployeeDataLoaded({required this.statisticResponse, required this.employeeResponse,required this.isReachedMax});

  @override
  List<Object?> get props => [employeeResponse,statisticResponse,isReachedMax];
}
class EmployeeDataFiltered extends EmployeeState{
  final String filter;
  final EmployeeResponse employeeResponse;
  final StatisticResponse statisticResponse;
  final bool isReachedMaxFiltered;

  const EmployeeDataFiltered({required this.statisticResponse, required this.employeeResponse,required this.isReachedMaxFiltered,required this.filter});

  @override
  List<Object?> get props => [employeeResponse,statisticResponse,isReachedMaxFiltered];
}

class EmployeeDataError extends EmployeeState{
  final String message;

  const EmployeeDataError({required this.message});

  @override
  List<Object?> get props => [message];

}
