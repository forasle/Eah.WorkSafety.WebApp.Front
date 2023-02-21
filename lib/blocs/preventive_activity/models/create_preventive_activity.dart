// To parse this JSON data, do
//
//     final createPreventiveActivityModel = createPreventiveActivityModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CreatePreventiveActivityModel createPreventiveActivityModelFromJson(String str) => CreatePreventiveActivityModel.fromJson(json.decode(str));

String createPreventiveActivityModelToJson(CreatePreventiveActivityModel data) => json.encode(data.toJson());

class CreatePreventiveActivityModel {
  CreatePreventiveActivityModel({
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

  factory CreatePreventiveActivityModel.fromJson(Map<String, dynamic> json) => CreatePreventiveActivityModel(
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
