import 'package:aeah_work_safety/models/employee.dart';

class OccupationDiseases {
  final double number;//
  final String referenceNumber;//
  final String diagnosis;//
  final Employee owner;//
  final String diagnosisDate;//
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
