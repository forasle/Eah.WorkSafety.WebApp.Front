import 'package:aeah_work_safety/models/person.dart';

class Mission {
  final double missionId;
  final String missionName;
  final String missionDepartment;
  final Person missionIdentifier;
  final Person missionOwner;
  final String missionDate;
  final String missionDeadline;
  final bool missionStatus;

  bool selected = false;

  Mission({
    required this.missionId,
    required this.missionName,
    required this.missionDepartment,
    required this.missionIdentifier,
    required this.missionOwner,
    required this.missionDate,
    required this.missionDeadline,
    required this.missionStatus,
  });
}
