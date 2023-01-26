// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    required this.username,
    required this.roleId,
    required this.userAddedAccidents,
    required this.userAddedMissions,
    required this.userAddedNearMisses,
    required this.userAddedRiskAssessments,
    required this.userAddedInconsistencies,
    required this.userAddedContingencyPlans,
    required this.userAddedPreventiveActivities,
  });

  String username;
  int roleId;
  List<UserAddedAccident> userAddedAccidents;
  List<UserAddedMission> userAddedMissions;
  List<UserAddedNearMiss> userAddedNearMisses;
  List<UserAddedRiskAssessment> userAddedRiskAssessments;
  List<UserAddedInconsistency> userAddedInconsistencies;
  List<UserAddedContingencyPlan> userAddedContingencyPlans;
  List<UserAddedPreventiveActivity> userAddedPreventiveActivities;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    username: json["username"],
    roleId: json["roleId"],
    userAddedAccidents: List<UserAddedAccident>.from(json["userAddedAccidents"].map((x) => UserAddedAccident.fromJson(x))),
    userAddedMissions: List<UserAddedMission>.from(json["userAddedMissions"].map((x) => UserAddedMission.fromJson(x))),
    userAddedNearMisses: List<UserAddedNearMiss>.from(json["userAddedNearMisses"].map((x) => UserAddedNearMiss.fromJson(x))),
    userAddedRiskAssessments: List<UserAddedRiskAssessment>.from(json["userAddedRiskAssessments"].map((x) => UserAddedRiskAssessment.fromJson(x))),
    userAddedInconsistencies: List<UserAddedInconsistency>.from(json["userAddedInconsistencies"].map((x) => UserAddedInconsistency.fromJson(x))),
    userAddedContingencyPlans: List<UserAddedContingencyPlan>.from(json["userAddedContingencyPlans"].map((x) => UserAddedContingencyPlan.fromJson(x))),
    userAddedPreventiveActivities: List<UserAddedPreventiveActivity>.from(json["userAddedPreventiveActivities"].map((x) => UserAddedPreventiveActivity.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "roleId": roleId,
    "userAddedAccidents": List<dynamic>.from(userAddedAccidents.map((x) => x.toJson())),
    "userAddedMissions": List<dynamic>.from(userAddedMissions.map((x) => x.toJson())),
    "userAddedNearMisses": List<dynamic>.from(userAddedNearMisses.map((x) => x.toJson())),
    "userAddedRiskAssessments": List<dynamic>.from(userAddedRiskAssessments.map((x) => x.toJson())),
    "userAddedInconsistencies": List<dynamic>.from(userAddedInconsistencies.map((x) => x.toJson())),
    "userAddedContingencyPlans": List<dynamic>.from(userAddedContingencyPlans.map((x) => x.toJson())),
    "userAddedPreventiveActivities": List<dynamic>.from(userAddedPreventiveActivities.map((x) => x.toJson())),
  };
}

class UserAddedAccident {
  UserAddedAccident({
    required this.accidentId,
  });

  int accidentId;

  factory UserAddedAccident.fromJson(Map<String, dynamic> json) => UserAddedAccident(
    accidentId: json["accidentId"],
  );

  Map<String, dynamic> toJson() => {
    "accidentId": accidentId,
  };
}

class UserAddedContingencyPlan {
  UserAddedContingencyPlan({
    required this.contingencyPlanId,
  });

  int contingencyPlanId;

  factory UserAddedContingencyPlan.fromJson(Map<String, dynamic> json) => UserAddedContingencyPlan(
    contingencyPlanId: json["contingencyPlanId"],
  );

  Map<String, dynamic> toJson() => {
    "contingencyPlanId": contingencyPlanId,
  };
}

class UserAddedInconsistency {
  UserAddedInconsistency({
    required this.inconsistencyId,
  });

  int inconsistencyId;

  factory UserAddedInconsistency.fromJson(Map<String, dynamic> json) => UserAddedInconsistency(
    inconsistencyId: json["inconsistencyId"],
  );

  Map<String, dynamic> toJson() => {
    "inconsistencyId": inconsistencyId,
  };
}

class UserAddedMission {
  UserAddedMission({
    required this.missionId,
  });

  int missionId;

  factory UserAddedMission.fromJson(Map<String, dynamic> json) => UserAddedMission(
    missionId: json["missionId"],
  );

  Map<String, dynamic> toJson() => {
    "missionId": missionId,
  };
}

class UserAddedNearMiss {
  UserAddedNearMiss({
    required this.nearMissId,
  });

  int nearMissId;

  factory UserAddedNearMiss.fromJson(Map<String, dynamic> json) => UserAddedNearMiss(
    nearMissId: json["nearMissId"],
  );

  Map<String, dynamic> toJson() => {
    "nearMissId": nearMissId,
  };
}

class UserAddedPreventiveActivity {
  UserAddedPreventiveActivity({
    required this.preventiveActivityId,
  });

  int preventiveActivityId;

  factory UserAddedPreventiveActivity.fromJson(Map<String, dynamic> json) => UserAddedPreventiveActivity(
    preventiveActivityId: json["preventiveActivityId"],
  );

  Map<String, dynamic> toJson() => {
    "preventiveActivityId": preventiveActivityId,
  };
}

class UserAddedRiskAssessment {
  UserAddedRiskAssessment({
    required this.riskAssessmentId,
  });

  int riskAssessmentId;

  factory UserAddedRiskAssessment.fromJson(Map<String, dynamic> json) => UserAddedRiskAssessment(
    riskAssessmentId: json["riskAssessmentId"],
  );

  Map<String, dynamic> toJson() => {
    "riskAssessmentId": riskAssessmentId,
  };
}
