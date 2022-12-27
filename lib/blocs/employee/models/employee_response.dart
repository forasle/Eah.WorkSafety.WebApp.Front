import 'dart:convert';

import 'package:aeah_work_safety/blocs/employee/models/employee.dart';

EmployeeResponse employeeResponseFromJson(String str) => EmployeeResponse.fromJson(json.decode(str));

String employeeResponseToJson(EmployeeResponse data) => json.encode(data.toJson());


class EmployeeResponse {
  EmployeeResponse({
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
  List<Employee> data;
  bool succeeded;
  dynamic errors;
  dynamic message;

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) => EmployeeResponse(
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    firstPage: json["firstPage"],
    lastPage: json["lastPage"],
    totalPages: json["totalPages"],
    totalRecords: json["totalRecords"],
    nextPage: json["nextPage"],
    previousPage: json["previousPage"],
    data: List<Employee>.from(json["data"].map((x) => Employee.fromJson(x))),
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
    "data": List<Employee>.from(data.map((x) => x.toJson())),
    "succeeded": succeeded,
    "errors": errors,
    "message": message,
  };
}
