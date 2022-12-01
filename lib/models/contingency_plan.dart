import 'package:aeah_work_safety/models/employee.dart';

class ContingencyPlans {
  final double number;//
  final String name;//
  final String referenceNumber;//
  final String info;//
  final Employee identifier;//
  final String date;//
  final String creationTime;//

  bool selected = false;

  ContingencyPlans({
    required this.referenceNumber,
    required this.name,
    required this.info,
    required this.identifier,
    required this.number,
    required this.date,
    required this.creationTime,
  });
}
