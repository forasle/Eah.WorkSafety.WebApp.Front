import 'package:aeah_work_safety/blocs/employee/models/employee.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';
import 'package:aeah_work_safety/blocs/employee/repository/employee_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository _employeeRepository = locator<EmployeeRepository>();
  final List<Employee> _employee= [];
  List<Employee> _employeeFiltered= [];
  int _page = 1;
  int _pageFiltered = 1;
  String _filter ="";
  final int _pageSize = 10;

  EmployeeBloc() : super(const EmployeeInitial(message: 'Bilgiler getiriliyor')) {

    on<GetEmployeeData>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
       final employeeResponse = await _employeeRepository.getEmployeeData(page : _page,pageSize: _pageSize);
       _page = employeeResponse.pageNumber+1;
       _employee.addAll(employeeResponse.data);
        employeeResponse.data = _employee;
       emit(EmployeeDataLoaded(employeeResponse: employeeResponse, isReachedMax: employeeResponse.nextPage==null));
      }
      catch(e){
        emit(EmployeeDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<GetEmployeeFiltered>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        _filter!=event.filter ? _pageFiltered=1 : _pageFiltered;
        _filter!=event.filter ? _employeeFiltered = [] : _employeeFiltered;
        final employeeResponseFiltered = await _employeeRepository.getEmployeeFiltered(page: _pageFiltered,pageSize: _pageSize,filter: event.filter);
        _pageFiltered = employeeResponseFiltered.pageNumber+1;
        _employeeFiltered.addAll(employeeResponseFiltered.data);
        employeeResponseFiltered.data = _employeeFiltered;
        _filter=event.filter;
        emit(EmployeeDataFiltered(employeeResponse: employeeResponseFiltered, filter: event.filter,isReachedMaxFiltered: employeeResponseFiltered.nextPage==null));
      }
      catch(e){
        emit(EmployeeDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );

    on<GetEmployeeDataById>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        final employee = await _employeeRepository.getEmployeeDataById(id: event.id);
        emit(EmployeeDataByIdLoaded(employee: employee, id: event.id));
      }
      catch(e){
        emit(EmployeeDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
        transformer: droppable(),
    );
  }
}
