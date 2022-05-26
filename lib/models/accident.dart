import 'package:aeah_work_safety/models/person.dart';

class Accident {
  final double accidentNumber;
  final String referenceNumber;
  final String accidentInfo;
  final Person accidentIdentifier;
  final String date;
  final bool rootCauseAnalysis;
  final double lostDays;

  bool selected = false;

  Accident({
    required this.referenceNumber,
    required this.accidentInfo,
    required this.accidentIdentifier,
    required this.accidentNumber,
    required this.date,
    required this.rootCauseAnalysis,
    required this.lostDays,
  });
}
