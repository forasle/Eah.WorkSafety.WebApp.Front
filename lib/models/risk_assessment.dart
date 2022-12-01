import 'package:aeah_work_safety/models/employee.dart';

class RiskAssessment {
  final String revisionDate;
  final String name;//
  final String referenceNumber;//
  final String riskAssessmentInfo;//
  final Employee riskAssessmentIdentifier;//
  final String riskAssessmentDate;//
  final String riskAssessmentCreationTime;//
  final String riskAssessmentMethod;

  bool selected = false;

  RiskAssessment({
    required this.riskAssessmentCreationTime,
    required this.name,
    required this.referenceNumber,
    required this.riskAssessmentInfo,
    required this.riskAssessmentIdentifier,
    required this.riskAssessmentDate,
    required this.revisionDate,
    required this.riskAssessmentMethod,
  });
}
