import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.username,
    required this.roleId,
    required this.accidents,
    required this.missions,
    required this.nearMisses,
    required this.riskAssessments,
    required this.inconsistencies,
    required this.contingencyPlans,
  });

  String username;
  int roleId;
  List<dynamic> accidents;
  List<int> missions;
  List<dynamic> nearMisses;
  List<int> riskAssessments;
  List<int> inconsistencies;
  List<dynamic> contingencyPlans;

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
    roleId: json["roleId"],
    accidents: List<dynamic>.from(json["accidents"].map((x) => x)),
    missions: List<int>.from(json["missions"].map((x) => x)),
    nearMisses: List<dynamic>.from(json["nearMisses"].map((x) => x)),
    riskAssessments: List<int>.from(json["riskAssessments"].map((x) => x)),
    inconsistencies: List<int>.from(json["inconsistencies"].map((x) => x)),
    contingencyPlans: List<dynamic>.from(json["contingencyPlans"].map((x) => x)),
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
  };
}
