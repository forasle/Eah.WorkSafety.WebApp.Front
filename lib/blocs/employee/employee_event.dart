part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class GetEmployeeData extends EmployeeEvent{
  final int page;
  final int pageSize;

  const GetEmployeeData({required this.page, required this.pageSize});

  @override
  List<Object> get props => [page,pageSize];
}
