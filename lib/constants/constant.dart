import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant{


  static const String materialAppTitle = "Eah İş Güvenliği Yönetim Sistemi";
  static const String loginPageLogoString = 'AEAH ISG YÖNETİM SİSTEMİ';
  static const String initialRoute = '/';

  static const double goldenRatio = 1.6180339887498948482045868343656381177203091798057628621354486227052604628189024497072;
  static const double loginPageOuterContainerWidth = 400;
  static const double loginPageOuterContainerHeight = loginPageOuterContainerWidth*goldenRatio;

  //Main
  static const MaterialColor primarySwatch = Colors.blueGrey;
  static const Color scaffoldBackgroundColor = Colors.white;

  //LoginPage
  static final BoxDecoration loginPanelBoxDecoration = BoxDecoration(borderRadius: BorderRadius.circular(20));
  static const EdgeInsetsGeometry padding8 = EdgeInsets.all(8.0);
  static const String loginText = "GİRİŞ YAP";
  static final TextStyle loginTextStyle = GoogleFonts.francoisOne(color: Colors.green,fontSize: 25);
  static final TextStyle loginSubTextStyle = GoogleFonts.francoisOne(color: Colors.black,fontSize: 15);
  static const Icon usernameBarIcon = Icon(Icons.person,color: Colors.black);
  static const Icon passwordBarIcon = Icon(Icons.password,color: Colors.black);
  static const UnderlineInputBorder usernameBarUnderlineBorder = UnderlineInputBorder(borderSide: BorderSide.none);
}