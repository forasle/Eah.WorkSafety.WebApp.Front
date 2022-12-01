import 'package:aeah_work_safety/models/employee.dart';

class Accident {
  final double number;
  final String referenceNumber;
  final String info;
  final Employee identifier;
  final String date;
  final bool rootCauseAnalysis;
  final double lostDays;

  bool selected = false;

  Accident({
    required this.referenceNumber,
    required this.info,
    required this.identifier,
    required this.number,
    required this.date,
    required this.rootCauseAnalysis,
    required this.lostDays,
  });
}
