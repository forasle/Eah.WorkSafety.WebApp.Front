import 'package:aeah_work_safety/models/person.dart';

class Inconsistencies {
  final String inconsistenciesName;
  final String inconsistenciesReferenceNumber;
  final String inconsistenciesInfo;
  final Person inconsistenciesIdentifier;
  final String inconsistenciesDate;
  final bool inconsistenciesRootCauseAnalysis;
  final String inconsistenciesDepartment;
  final String inconsistenciesStatus;
  final String inconsistenciesSupervisor;
  final String inconsistenciesRelation;
  final double inconsistenciesRiskScore;

  bool selected = false;

  Inconsistencies({
    required this.inconsistenciesReferenceNumber,
    required this.inconsistenciesInfo,
    required this.inconsistenciesIdentifier,
    required this.inconsistenciesDate,
    required this.inconsistenciesRootCauseAnalysis,
    required this.inconsistenciesDepartment,
    required this.inconsistenciesStatus,
    required this.inconsistenciesSupervisor,
    required this.inconsistenciesRelation,
    required this.inconsistenciesRiskScore,
    required this.inconsistenciesName,
  });
}
