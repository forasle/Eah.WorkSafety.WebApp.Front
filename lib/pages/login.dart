import 'package:eah_work_safety_web_app_front/constants/constant.dart';
import 'package:eah_work_safety_web_app_front/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: Constant.loginPageOuterContainerWidth,
          height: Constant.loginPageOuterContainerHeight,
          decoration: Constant.loginPanelBoxDecoration,
          child: Column(
            children: [
              Text(Constant.loginText, style: Constant.loginTextStyle),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Lütfen kullanıcı adınızı giriniz',
                  hintStyle: Constant.loginSubTextStyle,
                  labelText: 'Kullanıcı Adı',
                  labelStyle: Constant.loginSubTextStyle,
                  filled: true,
                  icon: Constant.usernameBarIcon,
                  border: Constant.usernameBarUnderlineBorder,
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Lütfen şifrenizi giriniz',
                  hintStyle: Constant.loginSubTextStyle,
                  labelText: 'Şifre',
                  labelStyle: Constant.loginSubTextStyle,
                  filled: true,
                  icon: Constant.passwordBarIcon,
                  border: Constant.usernameBarUnderlineBorder,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
