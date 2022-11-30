import 'package:flutter/material.dart';

class Constant{
  static Divider dividerWithIndents() {
    return const Divider(
      endIndent: 50,
      indent: 50,
    );
  }
  static const padding = EdgeInsets.all(8.0);

  static const sizedBoxWidth = SizedBox(
    width: 10,
  );
  static const sizedBoxHeight = SizedBox(
    width: 10,
  );
}