import 'package:aeah_work_safety/models/person.dart';

class RiskAssessment {
  final String riskAssessmentRevisionDate;
  final String riskAssessmentName;
  final String riskAssessmentReferenceNumber;
  final String riskAssessmentInfo;
  final Person riskAssessmentIdentifier;
  final String riskAssessmentDate;
  final String riskAssessmentCreationTime;
  final String riskAssessmentMethod;

  bool selected = false;

  RiskAssessment({
    required this.riskAssessmentCreationTime,
    required this.riskAssessmentName,
    required this.riskAssessmentReferenceNumber,
    required this.riskAssessmentInfo,
    required this.riskAssessmentIdentifier,
    required this.riskAssessmentDate,
    required this.riskAssessmentRevisionDate,
    required this.riskAssessmentMethod,
  });
}
