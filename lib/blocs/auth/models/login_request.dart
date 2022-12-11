import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    required this.userName,
    required this.password,
  });

  String userName;
  String password;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        userName: json["userName"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
      };
}
