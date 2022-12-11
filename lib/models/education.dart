import 'package:aeah_work_safety/blocs/user/models/employee_response.dart';

class Education {
  final String name;
  final double number;
  final String info;
  final EmployeeResponse identifier;
  final String date;
  final String time;
  final EmployeeResponse list;
  final bool status;

  bool selected = false;

  Education({
    required this.name,
    required this.info,
    required this.identifier,
    required this.number,
    required this.date,
    required this.status,
    required this.time,
    required this.list,
  });
}
