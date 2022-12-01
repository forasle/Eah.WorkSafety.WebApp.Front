import 'package:aeah_work_safety/models/employee.dart';

class Inconsistency {
  final String name;
  final String referenceNumber;
  final String info;
  final Employee identifier;
  final String date;
  final bool rootCauseAnalysis;
  final String department;
  final String status;
  final String supervisor;
  final String relation;
  final double riskScore;

  bool selected = false;

  Inconsistency({
    required this.referenceNumber,
    required this.info,
    required this.identifier,
    required this.date,
    required this.rootCauseAnalysis,
    required this.department,
    required this.status,
    required this.supervisor,
    required this.relation,
    required this.riskScore,
    required this.name,
  });
}
