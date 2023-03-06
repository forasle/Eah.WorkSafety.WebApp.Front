
import 'dart:convert';

List<Mission> missionFromJson(String str) => List<Mission>.from(json.decode(str)!.map((x) => Mission.fromJson(x)));

String missionToJson(List<Mission> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mission {
  Mission({
    required this.id,
    required this.name,
    required this.department,
    required this.assignerUserId,
    required this.assignedUserIdList,
    required this.date,
    required this.deadline,
    required this.status,
  });

  int id;
  String name;
  String department;
  int assignerUserId;
  List<dynamic>? assignedUserIdList;
  DateTime date;
  DateTime deadline;
  bool status;

  factory Mission.fromJson(Map<String, dynamic> json) => Mission(
    id: json["id"],
    name: json["name"],
    department: json["department"],
    assignerUserId: json["assignerUserId"],
    assignedUserIdList: json["assignedUserIdList"] == null ? [] : List<dynamic>.from(json["assignedUserIdList"]!.map((x) => x)),
    date: DateTime.parse(json["date"]),
    deadline: DateTime.parse(json["deadline"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "department": department,
    "assignerUserId": assignerUserId,
    "assignedUserIdList": assignedUserIdList == null ? [] : List<dynamic>.from(assignedUserIdList!.map((x) => x)),
    "date": date.toIso8601String(),
    "deadline": deadline.toIso8601String(),
    "status": status,
  };
}