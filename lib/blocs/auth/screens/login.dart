import 'package:aeah_work_safety/blocs/auth/auth_bloc.dart';
import 'package:aeah_work_safety/blocs/auth/models/login_request.dart';
import 'package:aeah_work_safety/constants/login/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _username;
    String? _password;

    final _formKey = GlobalKey<FormState>();
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
                    const Text("AEAH İSG YÖNETİM SİSTEMİ", style: Constant.title),
                    Padding(
                      padding: Constant.padding,
                      child: TextFormField(
                        onSaved: (newValue) {
                          _username = newValue;
                        },
                        validator: (value) {
                          if (value!.length < 4) {
                            return 'Kullanıcı adı 4 karakterden kısa olamaz';
                          }
                          return null;
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
                          if (value!.length < 4) {
                            return 'Şifre 4 karakterden kısa olamaz';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _password = newValue;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'Lütfen şifrenizi giriniz',
                            labelText: 'Şifre',
                            labelStyle: TextStyle(color: Colors.black),
                            filled: true,
                            icon: Icon(Icons.password, color: Colors.black),
                            border: Constant.border),
                      ),
                    ),
                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthLoginSuccessState) {
                          Navigator.pushNamed(context, panoramaRoute);
                        }
                      },
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthLoginFailState) {
                            return Text(state.message);
                          } else if (state is AuthLoginSuccessState) {
                            return const Text("Başarılı");
                          } else if (state is AuthInitState) {
                            return Text(state.message);
                          } else {
                            return const Text("Giriş yapılamadı");
                          }
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          LoginRequest loginRequest = LoginRequest(userName: _username!, password: _password!);
                          context.read<AuthBloc>().add(AuthSignInEvent(loginRequest: loginRequest));
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
