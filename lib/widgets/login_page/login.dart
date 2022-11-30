import 'package:aeah_work_safety/constants/login/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: Constant.outerContainerWidth,
          height: Constant.outerContainerHeight,
          decoration: Constant.boxDecoration,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: Constant.padding,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Lütfen Kullanıcı Adınızı giriniz',
                          labelText: 'Kullanıcı Adı',
                          labelStyle: TextStyle(color: Colors.black),
                          filled: true,
                          icon: Icon(Icons.email_rounded, color: Colors.black),
                          border: Constant.border),
                    ),
                  ),
                  const Padding(
                    padding: Constant.padding,
                    child: TextField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Lütfen şifrenizi giriniz',
                        labelText: 'Şifre',
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        icon: Icon(Icons.password, color: Colors.black),
                        border: Constant.border
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(panoramaRoute),
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
    );
  }
}
