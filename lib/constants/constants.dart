import 'package:flutter/material.dart';

double loginPageOuterContainerWidth = 400;
double loginPageOuterContainerHeight = 390;
String loginPageLogoString = 'AEAH ISG YÖNETİM SİSTEMİ';
double goldenRatio = 1.618;

double getWidth(context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return width;
}

double getHeight(context) {
  double height = MediaQuery.of(context).size.height;
  return height;
}

SizedBox sizedBoxBetweenPersonalDetailPage() {
  return const SizedBox(
    height: 10,
  );
}

Divider dividerWithIndents() {
  return const Divider(
    endIndent: 50,
    indent: 50,
  );
}

VerticalDivider verticalDividerWithIndents() {
  return const VerticalDivider(
    endIndent: 75,
    indent: 75,
  );
}
