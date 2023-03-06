
import 'dart:convert';

List<Inconsistency> inconsistencyFromJson(String str) => List<Inconsistency>.from(json.decode(str).map((x) => Inconsistency.fromJson(x)));

String inconsistencyToJson(List<Inconsistency> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Inconsistency {
  Inconsistency({
    required this.id,
    required this.sceneOfInconsistency,
    required this.information,
    required this.creatorUserId,
    required this.inconsistencyDate,
    required this.creationDate,
    required this.rootCauseAnalysisRequirement,
    required this.department,
    required this.status,
    required this.riskScore,
  });

  int id;
  String sceneOfInconsistency;
  String information;
  int creatorUserId;
  DateTime inconsistencyDate;
  DateTime creationDate;
  bool rootCauseAnalysisRequirement;
  String department;
  bool status;
  int riskScore;

  factory Inconsistency.fromJson(Map<String, dynamic> json) => Inconsistency(
    id: json["id"],
    sceneOfInconsistency: json["sceneOfInconsistency"],
    information: json["information"],
    creatorUserId: json["creatorUserId"],
    inconsistencyDate: DateTime.parse(json["inconsistencyDate"]),
    creationDate: DateTime.parse(json["creationDate"]),
    rootCauseAnalysisRequirement: json["rootCauseAnalysisRequirement"],
    department: json["department"],
    status: json["status"],
    riskScore: json["riskScore"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sceneOfInconsistency": sceneOfInconsistency,
    "information": information,
    "creatorUserId": creatorUserId,
    "inconsistencyDate": inconsistencyDate.toIso8601String(),
    "creationDate": creationDate.toIso8601String(),
    "rootCauseAnalysisRequirement": rootCauseAnalysisRequirement,
    "department": department,
    "status": status,
    "riskScore": riskScore,
  };
}
