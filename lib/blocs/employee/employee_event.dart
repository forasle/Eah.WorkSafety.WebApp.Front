part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class EmployeeInitialEvent extends EmployeeEvent{
  const EmployeeInitialEvent();
  @override
  List<Object> get props => [];
}

class GetEmployeeData extends EmployeeEvent{
  final bool needsRefresh;
  const GetEmployeeData({required this.needsRefresh});

  @override
  List<Object> get props => [needsRefresh];
}

class GetEmployeeFiltered extends EmployeeEvent{
  final bool needsRefresh;
  final String filter;
  const GetEmployeeFiltered({required this.filter,required this.needsRefresh});

  @override
  List<Object> get props => [filter,needsRefresh];
}

