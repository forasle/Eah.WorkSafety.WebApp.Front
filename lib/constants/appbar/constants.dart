import 'package:flutter/material.dart';

class Constant {
  static const drawerBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );

  static const drawerExpansionTileChildrenPadding = EdgeInsets.only(left: 35);
}
