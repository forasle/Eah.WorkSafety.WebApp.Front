import 'package:flutter/material.dart';

class Constant {
  static const dividerWithIndent = Divider(
    endIndent: 50,
    indent: 50,
  );

  static const verticalDivider = VerticalDivider(
    endIndent: 75,
    indent: 75,
  );

  static final textFormFieldBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: const BorderSide());

  static const sizedBoxWidth = SizedBox(
    width: 10,
  );

  static const sizedBox10H = SizedBox(
    height: 10,
  );

  static const sizedBox50W = SizedBox(
    width: 50,
  );

  static const sizedBox50H = SizedBox(
    height: 50,
  );

  static const sizedBoxHeight = SizedBox(
    height: 10,
  );

  static const padding = EdgeInsets.all(8.0);
}
