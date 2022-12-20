import 'package:aeah_work_safety/blocs/employee/models/employee_response.dart';

class OccupationDiseases {
  final double number; //
  final String referenceNumber; //
  final String diagnosis; //
  final EmployeeResponse owner; //
  final String diagnosisDate; //
  final String occupationDiseases;

  bool selected = false;

  OccupationDiseases({
    required this.occupationDiseases,
    required this.diagnosis,
    required this.diagnosisDate,
    required this.number,
    required this.owner,
    required this.referenceNumber,
  });
}
