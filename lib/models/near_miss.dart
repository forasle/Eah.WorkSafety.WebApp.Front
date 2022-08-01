import 'package:aeah_work_safety/models/person.dart';

class NearMiss {
  final double nearMissNumber;
  final String referenceNumber;
  final String nearMissInfo;
  final Person nearMissIdentifier;
  final String nearMissDate;
  final bool rootCauseAnalysis;

  bool selected = false;

  NearMiss({
    required this.referenceNumber,
    required this.nearMissInfo,
    required this.nearMissIdentifier,
    required this.nearMissNumber,
    required this.nearMissDate,
    required this.rootCauseAnalysis,
  });
}
