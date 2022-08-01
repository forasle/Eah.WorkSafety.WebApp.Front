import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: loginPageOuterContainerWidth,
          height: loginPageOuterContainerHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.blueGrey),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Lütfen e-mail adresinizi giriniz',
                          labelText: 'E-Mail',
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          icon: const Icon(Icons.email_rounded,
                              color: Colors.white),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Lütfen şifrenizi giriniz',
                          labelText: 'Şifre',
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          icon: const Icon(Icons.password, color: Colors.white),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(panaromaRoute);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Giriş',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ))
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
