import 'package:flutter/material.dart';

class Constant {
  static const dividerWithIndent = Divider(
    endIndent: 50,
    indent: 50,
  );

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

  static final textFormFieldBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: const BorderSide());

  static const verticalDivider = VerticalDivider(
    endIndent: 75,
    indent: 75,
  );

  static const List<DropdownMenuItem<String>> menuItemsForRiskMethodType = [
    DropdownMenuItem(child: Text("Fine Kinney Metodu"), value: "1"),
    DropdownMenuItem(child: Text("5x5 Matrix Metodu"), value: "2"),
    DropdownMenuItem(child: Text("3 Seviye (Basitleştirilmiş)"), value: "3"),
  ];

  static const List<DropdownMenuItem<String>> menuItemsForDepartmentType = [
    DropdownMenuItem(child: Text("Acil"), value: "1"),
    DropdownMenuItem(child: Text("Kvc Yoğun Bakım"), value: "2"),
  ];

  static const List<DropdownMenuItem<String>> menuItemsForInconsistenciesType = [
    DropdownMenuItem(child: Text("Uygunsuz Davranış"), value: "1"),
    DropdownMenuItem(child: Text("Uygunsuz Durum"), value: "2"),
  ];
}
