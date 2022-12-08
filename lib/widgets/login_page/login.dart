import 'dart:convert';

import 'package:aeah_work_safety/constants/login/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:aeah_work_safety/models/user.dart';
import 'package:aeah_work_safety/services/auth_api.dart';
import 'package:aeah_work_safety/services/jwt_decoder.dart';
import 'package:aeah_work_safety/services/user_api.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showWrongLoginInformation = false;
  @override
  Widget build(BuildContext context) {
    String? _username;
    String? _password;

    final _formKey = GlobalKey<FormState>();
    AuthAPI _authAPI = AuthAPI();
    UserAPI _userAPI = UserAPI();
    return Scaffold(
      body: Center(
        child: Container(
          width: Constant.outerContainerWidth,
          height: Constant.outerContainerHeight,
          decoration: Constant.boxDecoration,
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("AEAH İSG YÖNETİM SİSTEMİ",style: Constant.title),
                    Padding(
                      padding: Constant.padding,
                      child: TextFormField(
                        onSaved: (newValue) {
                          _username=newValue;
                        },
                        validator: (value) {
                          if(value!.length<4){
                            return 'Kullanıcı adı 4 karakterden kısa olamaz';
                          }
                        },
                        decoration: const InputDecoration(
                            hintText: 'Lütfen Kullanıcı Adınızı giriniz',
                            labelText: 'Kullanıcı Adı',
                            labelStyle: TextStyle(color: Colors.black),
                            filled: true,
                            icon: Icon(Icons.email_rounded, color: Colors.black),
                            border: Constant.border),
                      ),
                    ),
                    Padding(
                      padding: Constant.padding,
                      child: TextFormField(
                        validator: (value) {
                          if(value!.length<4){
                            return 'Şifre 4 karakterden kısa olamaz';
                          }
                        },
                       onSaved: (newValue) {
                         _password=newValue;
                       },
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Lütfen şifrenizi giriniz',
                          labelText: 'Şifre',
                          labelStyle: TextStyle(color: Colors.black),
                          filled: true,
                          icon: Icon(Icons.password, color: Colors.black),
                          border: Constant.border
                        ),

                      ),
                    ),
                    showWrongLoginInformation ? const Text("Hatalı Kullanıcı Adı veya Şifre") : const SizedBox(),
                    ElevatedButton(
                      onPressed: () async {
                        if(_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          try{
                            var response = await _authAPI.signIn(_username!, _password!);
                            if (response.statusCode==201){
                              Map<String, dynamic> token = json.decode(response.body.trim());
                              var tokenJson = parseJwt(token["token"]);
                              var userId =tokenJson["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"];
                              var userResponse = await _userAPI.userById(userId);
                              Map<String, dynamic> userJson = json.decode(userResponse.body.trim());
                              userJson["token"]=token["token"];
                              User user = User.fromJson(userJson);
                              Navigator.pushNamed(context, panoramaRoute,arguments: user);
                            }
                            else if(response.statusCode==400){
                              showWrongLoginInformation = true;
                              setState(() {

                              });
                            }
                          }
                          catch(e){
                            Text(e.toString());
                            setState(() {
                            });
                          }

                        }
                          },
                      child: const Padding(
                        padding: Constant.padding,
                        child: Text(
                          'GİRİŞ',
                          style: Constant.buttonTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
