import 'dart:convert';

StatisticResponse statisticResponseFromJson(String str) => StatisticResponse.fromJson(json.decode(str));

String statisticResponseToJson(StatisticResponse data) => json.encode(data.toJson());

class StatisticResponse {
  StatisticResponse({
    required this.numberOfEmployee,
    required this.numberOfUser,
    required this.averageAgeOfEmployee,
    required this.averageDayOfWork,
    required this.totalLostDays,
    required this.totalEmployeeAccident,
    required this.totalLostDaysAccident,
    required this.totalNeedFirstAidAccident,
    required this.totalNeedFirstAidButNoLostDaysAccident,
    required this.numberOfChronicDisease,
    required this.numberOfOccupationDisease,
    required this.numberOfAccidents,
    required this.dayOfLastAccident,
    required this.numberOfNearMisses,
    required this.numberOfRiskAssessments,
    required this.numberOfInconsistencies,
    required this.numberOfContingencyPlans,
    required this.numberOfPreventiveActivities,
    required this.numberOfMissions,
    required this.dayWithoutAccident
  });

  int numberOfEmployee;
  int numberOfUser;
  double averageAgeOfEmployee;
  double averageDayOfWork;
  int totalLostDays;
  int totalEmployeeAccident;
  int totalLostDaysAccident;
  int totalNeedFirstAidAccident;
  int totalNeedFirstAidButNoLostDaysAccident;
  int numberOfChronicDisease;
  int numberOfOccupationDisease;
  int numberOfAccidents;
  DateTime dayOfLastAccident;
  int numberOfNearMisses;
  int numberOfRiskAssessments;
  int numberOfInconsistencies;
  int numberOfContingencyPlans;
  int numberOfPreventiveActivities;
  int numberOfMissions;
  int dayWithoutAccident;

  factory StatisticResponse.fromJson(Map<String, dynamic> json) => StatisticResponse(
    numberOfEmployee: json["numberOfEmployee"],
    numberOfUser: json["numberOfUser"],
    averageAgeOfEmployee: json["averageAgeOfEmployee"].toDouble(),
    averageDayOfWork: json["averageDayOfWork"].toDouble(),
    totalLostDays: json["totalLostDays"],
    totalEmployeeAccident: json["totalEmployeeAccident"],
    totalLostDaysAccident: json["totalLostDaysAccident"],
    totalNeedFirstAidAccident: json["totalNeedFirstAidAccident"],
    totalNeedFirstAidButNoLostDaysAccident: json["totalNeedFirstAidButNoLostDaysAccident"],
    numberOfChronicDisease: json["numberOfChronicDisease"],
    numberOfOccupationDisease: json["numberOfOccupationDisease"],
    numberOfAccidents: json["numberOfAccidents"],
    dayOfLastAccident: DateTime.parse(json["dayOfLastAccident"]),
    numberOfNearMisses: json["numberOfNearMisses"],
    numberOfRiskAssessments: json["numberOfRiskAssessments"],
    numberOfInconsistencies: json["numberOfInconsistencies"],
    numberOfContingencyPlans: json["numberOfContingencyPlans"],
    numberOfPreventiveActivities: json["numberOfPreventiveActivities"],
    numberOfMissions: json["numberOfMissions"],
    dayWithoutAccident: json["dayWithoutAccident"],
  );

  Map<String, dynamic> toJson() => {
    "numberOfEmployee": numberOfEmployee,
    "numberOfUser": numberOfUser,
    "averageAgeOfEmployee": averageAgeOfEmployee,
    "averageDayOfWork": averageDayOfWork,
    "totalLostDays": totalLostDays,
    "totalEmployeeAccident": totalEmployeeAccident,
    "totalLostDaysAccident": totalLostDaysAccident,
    "totalNeedFirstAidAccident": totalNeedFirstAidAccident,
    "totalNeedFirstAidButNoLostDaysAccident": totalNeedFirstAidButNoLostDaysAccident,
    "numberOfChronicDisease": numberOfChronicDisease,
    "numberOfOccupationDisease": numberOfOccupationDisease,
    "numberOfAccidents": numberOfAccidents,
    "dayOfLastAccident": dayOfLastAccident.toIso8601String(),
    "numberOfNearMisses": numberOfNearMisses,
    "numberOfRiskAssessments": numberOfRiskAssessments,
    "numberOfInconsistencies": numberOfInconsistencies,
    "numberOfContingencyPlans": numberOfContingencyPlans,
    "numberOfPreventiveActivities": numberOfPreventiveActivities,
    "numberOfMissions": numberOfMissions,
    "dayWithoutAccident": dayWithoutAccident,
  };
}
