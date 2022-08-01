import 'package:aeah_work_safety/models/person.dart';

class ContingencyPlans {
  final double contingencyPlansNumber;
  final String contingencyName;
  final String contingencyReferenceNumber;
  final String contingencyInfo;
  final Person contingencyIdentifier;
  final String contingencyDate;
  final String contingencyCreationTime;

  bool selected = false;

  ContingencyPlans({
    required this.contingencyReferenceNumber,
    required this.contingencyName,
    required this.contingencyInfo,
    required this.contingencyIdentifier,
    required this.contingencyPlansNumber,
    required this.contingencyDate,
    required this.contingencyCreationTime,
  });
}
