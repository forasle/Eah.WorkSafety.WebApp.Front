import 'dart:convert';

StatisticResponse statisticResponseFromJson(String str) => StatisticResponse.fromJson(json.decode(str));

String statisticResponseToJson(StatisticResponse data) => json.encode(data.toJson());

class StatisticResponse {
  StatisticResponse({
    required this.numberOfEmployee,
    required this.numberOfChronicDisease,
    required this.numberOfOccupationDisease,
    required this.numberOfAccidents,
    required this.lastAccidentDate,
    required this.numberOfNearMisses,
    required this.numberOfRiskAssessments,
    required this.numberOfInconsistencies,
    required this.numberOfContingencyPlans,
    required this.numberOfPreventiveActivities,
    required this.dayWithoutAccident,
  });

  int numberOfEmployee;
  int numberOfChronicDisease;
  int numberOfOccupationDisease;
  int numberOfAccidents;
  DateTime lastAccidentDate;
  int numberOfNearMisses;
  int numberOfRiskAssessments;
  int numberOfInconsistencies;
  int numberOfContingencyPlans;
  int numberOfPreventiveActivities;
  int dayWithoutAccident;

  factory StatisticResponse.fromJson(Map<String, dynamic> json) => StatisticResponse(
    numberOfEmployee: json["numberOfEmployee"],
    numberOfChronicDisease: json["numberOfChronicDisease"],
    numberOfOccupationDisease: json["numberOfOccupationDisease"],
    numberOfAccidents: json["numberOfAccidents"],
    lastAccidentDate: DateTime.parse(json["lastAccidentDate"]),
    numberOfNearMisses: json["numberOfNearMisses"],
    numberOfRiskAssessments: json["numberOfRiskAssessments"],
    numberOfInconsistencies: json["numberOfInconsistencies"],
    numberOfContingencyPlans: json["numberOfContingencyPlans"],
    numberOfPreventiveActivities: json["numberOfPreventiveActivities"],
    dayWithoutAccident: json["dayWithoutAccident"],
  );

  Map<String, dynamic> toJson() => {
    "numberOfEmployee": numberOfEmployee,
    "numberOfChronicDisease": numberOfChronicDisease,
    "numberOfOccupationDisease": numberOfOccupationDisease,
    "numberOfAccidents": numberOfAccidents,
    "lastAccidentDate": lastAccidentDate.toIso8601String(),
    "numberOfNearMisses": numberOfNearMisses,
    "numberOfRiskAssessments": numberOfRiskAssessments,
    "numberOfInconsistencies": numberOfInconsistencies,
    "numberOfContingencyPlans": numberOfContingencyPlans,
    "numberOfPreventiveActivities": numberOfPreventiveActivities,
    "dayWithoutAccident": dayWithoutAccident,
  };
}
