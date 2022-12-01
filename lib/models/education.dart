import 'package:aeah_work_safety/models/employee.dart';

class Education {
  final String name;
  final double number;
  final String info;
  final Employee identifier;
  final String date;
  final String time;
  final Employee list;
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
