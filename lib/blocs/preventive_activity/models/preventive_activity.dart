
import 'dart:convert';

List<PreventiveActivity> preventiveActivityFromJson(String str) => List<PreventiveActivity>.from(json.decode(str)!.map((x) => PreventiveActivity.fromJson(x)));

String accidentToJson(List<PreventiveActivity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PreventiveActivity {
  PreventiveActivity({
    required this.id,
    required this.name,
    required this.information,
    required this.referenceNumber,
    required this.creatorUserId,
    required this.status,
    required this.rootCauseAnalysis,
    required this.deadline,
    required this.date,
    required this.creationTime,
    required this.method,
  });

  int id;
  String name;
  String information;
  String referenceNumber;
  int creatorUserId;
  bool status;
  bool rootCauseAnalysis;
  DateTime deadline;
  DateTime date;
  DateTime creationTime;
  String method;

  factory PreventiveActivity.fromJson(Map<String, dynamic> json) => PreventiveActivity(
    id: json["id"],
    name: json["name"],
    information: json["information"],
    referenceNumber: json["referenceNumber"],
    creatorUserId: json["creatorUserId"],
    status: json["status"],
    rootCauseAnalysis: json["rootCauseAnalysis"],
    deadline: DateTime.parse(json["deadline"]),
    date: DateTime.parse(json["date"]),
    creationTime: DateTime.parse(json["creationTime"]),
    method: json["method"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "information": information,
    "referenceNumber": referenceNumber,
    "creatorUserId": creatorUserId,
    "status": status,
    "rootCauseAnalysis": rootCauseAnalysis,
    "deadline": deadline.toIso8601String(),
    "date": date.toIso8601String(),
    "creationTime": creationTime.toIso8601String(),
    "method": method,
  };
}