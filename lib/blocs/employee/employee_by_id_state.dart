part of 'employee_by_id_bloc.dart';

abstract class EmployeeByIdState extends Equatable {
  const EmployeeByIdState();
}

class EmployeeByIdInitial extends EmployeeByIdState {
  @override
  List<Object> get props => [];
}

class EmployeeDataLoadedById extends EmployeeByIdState{
  final Employee employee;

  const EmployeeDataLoadedById({required this.employee});

  @override
  List<Object?> get props => [employee];
}

class EmployeeByIdDataError extends EmployeeByIdState{
  final String message;

  const EmployeeByIdDataError({required this.message});

  @override
  List<Object?> get props => [message];

}
