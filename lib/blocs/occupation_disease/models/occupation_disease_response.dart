import 'dart:convert';

import 'package:aeah_work_safety/blocs/chronic_disease/models/chronic_disease.dart';
import 'package:aeah_work_safety/blocs/occupation_disease/models/occupation_disease.dart';

OccupationDiseaseResponse? cccupationDiseaseResponseFromJson(String str) => OccupationDiseaseResponse.fromJson(json.decode(str));

String cccupationDiseaseResponseToJson(OccupationDiseaseResponse? data) => json.encode(data!.toJson());

class OccupationDiseaseResponse {
  OccupationDiseaseResponse({
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

  int pageNumber;
  int pageSize;
  String firstPage;
  String lastPage;
  int totalPages;
  int totalRecords;
  String? nextPage;
  String? previousPage;
  List<OccupationDisease> data;
  bool succeeded;
  dynamic errors;
  dynamic message;

  factory OccupationDiseaseResponse.fromJson(Map<String, dynamic> json) => OccupationDiseaseResponse(
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    firstPage: json["firstPage"],
    lastPage: json["lastPage"],
    totalPages: json["totalPages"],
    totalRecords: json["totalRecords"],
    nextPage: json["nextPage"],
    previousPage: json["previousPage"],
    data: List<OccupationDisease>.from(json["data"]!.map((x) => OccupationDisease.fromJson(x))),
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
    "data": List<OccupationDisease>.from(data.map((x) => x.toJson())),
    "succeeded": succeeded,
    "errors": errors,
    "message": message,
  };
}