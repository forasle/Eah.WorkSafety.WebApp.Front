import 'package:aeah_work_safety/models/person.dart';

class Education {
  final String educationName;
  final double educationNumber;
  final String educationInfo;
  final Person educationIdentifier;
  final String educationDate;
  final String educationTime;
  final Person educationalist;
  final bool educationStatus;

  bool selected = false;

  Education({
    required this.educationName,
    required this.educationInfo,
    required this.educationIdentifier,
    required this.educationNumber,
    required this.educationDate,
    required this.educationStatus,
    required this.educationTime,
    required this.educationalist,
  });
}
