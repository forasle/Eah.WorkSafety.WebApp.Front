import 'package:aeah_work_safety/blocs/user/models/employee_response.dart';

class NearMiss {
  final double number;
  final String referenceNumber;
  final String info;
  final EmployeeResponse identifier;
  final String date;
  final bool rootCauseAnalysis;

  bool selected = false;

  NearMiss({
    required this.referenceNumber,
    required this.info,
    required this.identifier,
    required this.number,
    required this.date,
    required this.rootCauseAnalysis,
  });
}
