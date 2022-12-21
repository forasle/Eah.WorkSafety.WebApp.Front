import 'package:aeah_work_safety/blocs/employee/models/employee.dart';
import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';

class Mission {
  final double id;
  final String name;
  final String department;
  final Employee identifier;
  final Employee owner;
  final String date;
  final String deadline;
  final bool status;

  bool selected = false;

  Mission({
    required this.id,
    required this.name,
    required this.department,
    required this.identifier,
    required this.owner,
    required this.date,
    required this.deadline,
    required this.status,
  });
}
