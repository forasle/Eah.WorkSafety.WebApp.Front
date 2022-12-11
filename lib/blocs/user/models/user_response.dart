import 'dart:convert';

List<UserResponse> userFromJson(String str) =>
    List<UserResponse>.from(json.decode(str).map((x) => UserResponse.fromJson(x)));

String userToJson(List<UserResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserResponse {
  UserResponse({
    required this.username,
    required this.roleId,
    required this.accidents,
    required this.missions,
    required this.nearMisses,
    required this.riskAssessments,
    required this.inconsistencies,
    required this.contingencyPlans,
    required this.preventiveActivities,
    required this.token,
  });

  String username;
  int roleId;
  List<dynamic> accidents;
  List<dynamic> missions;
  List<dynamic> nearMisses;
  List<int> riskAssessments;
  List<dynamic> inconsistencies;
  List<dynamic> contingencyPlans;
  List<int> preventiveActivities;
  String token;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        username: json["username"],
        roleId: json["roleId"],
        accidents: List<dynamic>.from(json["accidents"].map((x) => x)),
        missions: List<dynamic>.from(json["missions"].map((x) => x)),
        nearMisses: List<dynamic>.from(json["nearMisses"].map((x) => x)),
        riskAssessments: List<int>.from(json["riskAssessments"].map((x) => x)),
        inconsistencies: List<dynamic>.from(json["inconsistencies"].map((x) => x)),
        contingencyPlans: List<dynamic>.from(json["contingencyPlans"].map((x) => x)),
        preventiveActivities: List<int>.from(json["preventiveActivities"].map((x) => x)),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "roleId": roleId,
        "accidents": List<dynamic>.from(accidents.map((x) => x)),
        "missions": List<dynamic>.from(missions.map((x) => x)),
        "nearMisses": List<dynamic>.from(nearMisses.map((x) => x)),
        "riskAssessments": List<dynamic>.from(riskAssessments.map((x) => x)),
        "inconsistencies": List<dynamic>.from(inconsistencies.map((x) => x)),
        "contingencyPlans": List<dynamic>.from(contingencyPlans.map((x) => x)),
        "preventiveActivities": List<dynamic>.from(preventiveActivities.map((x) => x)),
        "token": token,
      };
}
