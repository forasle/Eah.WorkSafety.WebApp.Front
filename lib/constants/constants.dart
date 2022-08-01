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

SizedBox sizedBoxBetweenExposedPerson() {
  return const SizedBox(
    width: 20,
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

List<DropdownMenuItem<String>> menuItemsForInconsistenciesType = [
  const DropdownMenuItem(child: Text("Uygunsuz Davranış"), value: "1"),
  const DropdownMenuItem(child: Text("Uygunsuz Durum"), value: "2"),
];

List<DropdownMenuItem<String>> menuItemsForDepartmentType = [
  DropdownMenuItem(child: Text("Acil"), value: "1"),
  DropdownMenuItem(child: Text("Kvc Yoğun Bakım"), value: "2"),
];

List<DropdownMenuItem<String>> menuItemsForRiskMethodType = [
  DropdownMenuItem(child: Text("Fine Kinney Metodu"), value: "1"),
  DropdownMenuItem(child: Text("5x5 Matrix Metodu"), value: "2"),
  DropdownMenuItem(child: Text("3 Seviye (Basitleştirilmiş)"), value: "3"),
];

List<DropdownMenuItem<String>> menuItemsForEventType = [
  DropdownMenuItem(child: Text("İş Kazası"), value: "1"),
  DropdownMenuItem(child: Text("Ramak Kala"), value: "2"),
];

List<DropdownMenuItem<String>> menuItemsForPreventiveActivities = [
  DropdownMenuItem(child: Text("Düzenleyici"), value: "1"),
  DropdownMenuItem(child: Text("Önleyici"), value: "2"),
];

List<DropdownMenuItem<String>> menuItemsForGender = [
  DropdownMenuItem(child: Text("Erkek"), value: "1"),
  DropdownMenuItem(child: Text("Kadın"), value: "2"),
];

List<DropdownMenuItem<String>> menuItemsForTemplate = [
  DropdownMenuItem(child: Text("Şablonsuz"), value: "1"),
  DropdownMenuItem(child: Text("Acil Servis"), value: "2"),
  DropdownMenuItem(child: Text("Yoğun Bakım"), value: "3"),
  DropdownMenuItem(child: Text("Servis"), value: "4"),
];

List<String> menuItemsForExposedPerson = [
  "Doktor",
  "Hemşire",
  "Sağ.Mem",
  "Sağ.Tek.",
  "Veri Kayıt Elemanı",
  "Teknik Per.",
  "Temizlik Görev.",
  "Güv. Görev.",
  "Refakatçı",
  "Misafir",
];
