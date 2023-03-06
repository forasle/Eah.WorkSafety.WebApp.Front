
import 'dart:convert';

List<PreventiveActivity> preventiveActivityFromJson(String str) => List<PreventiveActivity>.from(json.decode(str).map((x) => PreventiveActivity.fromJson(x)));

String preventiveActivityToJson(List<PreventiveActivity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PreventiveActivity {
  PreventiveActivity({
    required this.id,
    required this.name,
    required this.information,
    required this.sceneOfPreventiveActivity,
    required this.creatorUserId,
    required this.status,
    required this.rootCauseAnalysis,
    required this.deadline,
    required this.preventiveActivityDate,
    required this.creationDate,
    required this.method,
  });

  int id;
  String name;
  String information;
  String sceneOfPreventiveActivity;
  int creatorUserId;
  bool status;
  bool rootCauseAnalysis;
  DateTime deadline;
  DateTime preventiveActivityDate;
  DateTime creationDate;
  String method;

  factory PreventiveActivity.fromJson(Map<String, dynamic> json) => PreventiveActivity(
    id: json["id"],
    name: json["name"],
    information: json["information"],
    sceneOfPreventiveActivity: json["sceneOfPreventiveActivity"],
    creatorUserId: json["creatorUserId"],
    status: json["status"],
    rootCauseAnalysis: json["rootCauseAnalysis"],
    deadline: DateTime.parse(json["deadline"]),
    preventiveActivityDate: DateTime.parse(json["preventiveActivityDate"]),
    creationDate: DateTime.parse(json["creationDate"]),
    method: json["method"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "information": information,
    "sceneOfPreventiveActivity": sceneOfPreventiveActivity,
    "creatorUserId": creatorUserId,
    "status": status,
    "rootCauseAnalysis": rootCauseAnalysis,
    "deadline": deadline.toIso8601String(),
    "preventiveActivityDate": preventiveActivityDate.toIso8601String(),
    "creationDate": creationDate.toIso8601String(),
    "method": method,
  };
}
