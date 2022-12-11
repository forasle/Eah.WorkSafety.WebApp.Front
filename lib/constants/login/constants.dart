import 'package:flutter/material.dart';

class Constant {
  static const double outerContainerWidth = 450;
  static const double outerContainerHeight = outerContainerWidth / goldenRatio;
  static const double goldenRatio = 1.618033988749894;

  static BoxDecoration boxDecoration = BoxDecoration(borderRadius: BorderRadius.circular(20));

  static const EdgeInsets padding = EdgeInsets.all(8.0);

  static const InputBorder border = UnderlineInputBorder(borderSide: BorderSide.none);

  static const Icon userBarIcon = Icon(Icons.email_rounded, color: Colors.black);

  static const TextStyle textStyle = TextStyle(color: Colors.blueGrey, fontSize: 25);

  static const TextStyle buttonTextStyle = TextStyle(color: Colors.black, fontSize: 25);

  static const TextStyle subTextStyle = TextStyle(color: Colors.black, fontSize: 15);

  static const TextStyle title = TextStyle(color: Colors.blueGrey, fontSize: 25, fontWeight: FontWeight.bold);
}
