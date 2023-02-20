
import 'dart:convert';

CreateInconsistencyModel inconsistencyFromJson(String str) => CreateInconsistencyModel.fromJson(json.decode(str));

String inconsistencyToJson(CreateInconsistencyModel data) => json.encode(data.toJson());

class CreateInconsistencyModel {
  CreateInconsistencyModel({
    required this.id,
    required this.referenceNumber,
    required this.information,
    required this.date,
    required this.rootCauseAnalysisRequirement,
    required this.department,
    required this.status,
    required this.riskScore,
    required this.creatorUserId,
  });

  int id;
  String referenceNumber;
  String information;
  DateTime date;
  bool rootCauseAnalysisRequirement;
  String department;
  bool status;
  int riskScore;
  int creatorUserId;

  factory CreateInconsistencyModel.fromJson(Map<String, dynamic> json) => CreateInconsistencyModel(
    id: json["id"],
    referenceNumber: json["referenceNumber"],
    information: json["information"],
    date: DateTime.parse(json["date"]),
    rootCauseAnalysisRequirement: json["rootCauseAnalysisRequirement"],
    department: json["department"],
    status: json["status"],
    riskScore: json["riskScore"],
    creatorUserId: json["creatorUserId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "referenceNumber": referenceNumber,
    "information": information,
    "date": date.toIso8601String(),
    "rootCauseAnalysisRequirement": rootCauseAnalysisRequirement,
    "department": department,
    "status": status,
    "riskScore": riskScore,
    "creatorUserId": creatorUserId,
  };
}