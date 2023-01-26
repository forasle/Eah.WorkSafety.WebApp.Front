import 'dart:convert';

import 'package:aeah_work_safety/blocs/mission/models/mission.dart';

MissionResponse? missionResponseFromJson(String str) => MissionResponse.fromJson(json.decode(str));

String missionResponseToJson(MissionResponse? data) => json.encode(data!.toJson());

class MissionResponse {
  MissionResponse({
    required this.pageNumber,
    required this.pageSize,
    required this.firstPage,
    required this.lastPage,
    required this.totalPages,
    required this.totalRecords,
    required this.nextPage,
    required this.previousPage,
    required this.data,
    required this.succeeded,
    required this.errors,
    required this.message,
  });

  int? pageNumber;
  int? pageSize;
  String? firstPage;
  String? lastPage;
  int? totalPages;
  int? totalRecords;
  dynamic nextPage;
  dynamic previousPage;
  List<Mission> data;
  bool? succeeded;
  dynamic errors;
  dynamic message;

  factory MissionResponse.fromJson(Map<String, dynamic> json) => MissionResponse(
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    firstPage: json["firstPage"],
    lastPage: json["lastPage"],
    totalPages: json["totalPages"],
    totalRecords: json["totalRecords"],
    nextPage: json["nextPage"],
    previousPage: json["previousPage"],
    data: List<Mission>.from(json["data"]!.map((x) => Mission.fromJson(x))),
    succeeded: json["succeeded"],
    errors: json["errors"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "firstPage": firstPage,
    "lastPage": lastPage,
    "totalPages": totalPages,
    "totalRecords": totalRecords,
    "nextPage": nextPage,
    "previousPage": previousPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "succeeded": succeeded,
    "errors": errors,
    "message": message,
  };
}