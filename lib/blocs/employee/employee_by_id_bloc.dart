import 'dart:async';
import 'package:aeah_work_safety/blocs/employee/models/employee.dart';
import 'package:aeah_work_safety/blocs/employee/repository/employee_repository.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'employee_by_id_event.dart';
part 'employee_by_id_state.dart';

class EmployeeByIdBloc extends Bloc<EmployeeByIdEvent, EmployeeByIdState> {
  EmployeeByIdBloc() : super(EmployeeByIdInitial()) {
    final EmployeeRepository _employeeRepository = locator<EmployeeRepository>();
    on<GetEmployeeDataById>((event, emit) async {
      try{
        await Future.delayed(const Duration(milliseconds: 500));
        final employee = await _employeeRepository.getEmployeeDataById(id: event.id);
        emit(EmployeeDataLoadedById(employee: employee));
      }
      catch(e){
        emit(EmployeeByIdDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
    on<EmployeeByIdInitialEvent>((event, emit) async {
      try{
        //await Future.delayed(const Duration(milliseconds: 500));
        emit(EmployeeByIdInitial());
      }
      catch(e){
        emit(EmployeeByIdDataError(message: "Bilgiler getirilemedi. Hata: $e"));
      }
    },
      transformer: droppable(),
    );
  }
}
