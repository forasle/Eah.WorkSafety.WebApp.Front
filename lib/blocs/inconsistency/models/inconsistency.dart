
import 'dart:convert';

List<Inconsistency> inconsistencyFromJson(String str) => List<Inconsistency>.from(json.decode(str)!.map((x) => Inconsistency.fromJson(x)));

String accidentToJson(List<Inconsistency> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Inconsistency {
  Inconsistency({
    required this.id,
    required this.referenceNumber,
    required this.information,
    required this.creatorUserId,
    required this.date,
    required this.rootCauseAnalysisRequirement,
    required this.department,
    required this.status,
    required this.riskScore,
  });

  int id;
  String? referenceNumber;
  String? information;
  int? creatorUserId;
  DateTime? date;
  bool? rootCauseAnalysisRequirement;
  String? department;
  bool? status;
  int? riskScore;

  factory Inconsistency.fromJson(Map<String, dynamic> json) => Inconsistency(
    id: json["id"],
    referenceNumber: json["referenceNumber"],
    information: json["information"],
    creatorUserId: json["creatorUserId"],
    date: DateTime.parse(json["date"]),
    rootCauseAnalysisRequirement: json["rootCauseAnalysisRequirement"],
    department: json["department"],
    status: json["status"],
    riskScore: json["riskScore"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "referenceNumber": referenceNumber,
    "information": information,
    "creatorUserId": creatorUserId,
    "date": date?.toIso8601String(),
    "rootCauseAnalysisRequirement": rootCauseAnalysisRequirement,
    "department": department,
    "status": status,
    "riskScore": riskScore,
  };
}