import 'package:flutter/material.dart';

class Constant{
  static const dividerWithIndent = Divider(
    endIndent: 50,
    indent: 50,
  );
  static const verticalDivider = VerticalDivider(
    endIndent: 75,
    indent: 75,
  );
  static const sizedBox50W = SizedBox(
    width: 50,
  );

  static const sizedBox5W = SizedBox(
    width: 5,
  );

  static const sizedBox50H = SizedBox(
    height: 50,
  );
  static const padding20 = EdgeInsets.all(20.0);

  static const padding8 = EdgeInsets.all(8.0);

  static final textFormFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide());

  static const sizedBox10H = SizedBox(
    height: 10,
  );

  static const List<DropdownMenuItem<String>> menuItemsForGender = [
    DropdownMenuItem(child: Text("Erkek"), value: "1"),
    DropdownMenuItem(child: Text("Kadın"), value: "2"),
  ];
}