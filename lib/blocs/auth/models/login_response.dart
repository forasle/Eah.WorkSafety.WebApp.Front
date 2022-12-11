import 'dart:convert';

LoginResponse authFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String authToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.token,
    required this.expireDate,
  });

  String token;
  DateTime expireDate;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        expireDate: DateTime.parse(json["expireDate"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "expireDate": expireDate.toIso8601String(),
      };
}
