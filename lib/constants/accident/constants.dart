import 'package:flutter/material.dart';

class Constant {
  static const dividerWithIndent = Divider(
    endIndent: 50,
    indent: 50,
  );

  static const verticalDivider = VerticalDivider(
    endIndent: 5,
    indent: 5,
  );

  static const padding = EdgeInsets.all(8.0);

  static const sizedBox = SizedBox(
    width: 10,
  );
  static const sizedBox50 = SizedBox(
    height: 50,
  );

  static const List<DropdownMenuItem<String>> menuItemsForEventType = [
    DropdownMenuItem(child: Text("İş Kazası"), value: "1"),
    DropdownMenuItem(child: Text("Ramak Kala"), value: "2"),
  ];

  static const List<DropdownMenuItem<String>> menuItemsForDepartmentType = [
    DropdownMenuItem(child: Text("Acil"), value: "1"),
    DropdownMenuItem(child: Text("Kvc Yoğun Bakım"), value: "2"),
  ];

  static final textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
  );
}
