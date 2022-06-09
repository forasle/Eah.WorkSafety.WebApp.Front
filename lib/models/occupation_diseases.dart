import 'package:aeah_work_safety/models/person.dart';

class OccupationDiseases {
  final double occupationDiseasesNumber;
  final String occupationDiseasesreferenceNumber;
  final String occupationDiseasesDiagnosis;
  final Person occupationDiseasesOwner;
  final String occupationDiseasesDiagnosisdate;
  final String occupationDiseases;

  bool selected = false;

  OccupationDiseases({
    required this.occupationDiseases,
    required this.occupationDiseasesDiagnosis,
    required this.occupationDiseasesDiagnosisdate,
    required this.occupationDiseasesNumber,
    required this.occupationDiseasesOwner,
    required this.occupationDiseasesreferenceNumber,
  });
}
