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


  static const TextStyle buttonTextStyle = TextStyle(color: Colors.black, fontSize: 25);

  static final List<String> theSubjectOfTheAccident = [
    'Fiziksel şiddete maruz kalma',
    'Sözlü şiddete maruz kalma',
    'Kesici delici alet yaralanmaları',
    'Biyolojik etkene maruz kalma',
    'Düşme,çarpma yaralanmaları',
    'Trafik Kazası(Maddi Hasarlı)',
    'Trafik Kazası(Yaralanmalı)',
    'Kimyasal madde ile temasa maruz kalma',
    'Yangın ve yanığa maruz kalma',
    'Ofis kazaları',
    'Elektrik kazaları',
  ];
  static final List<String> precautionsToBeTaken = [
    'Yetkisi olmadan çalışmak',
    'Hatalı uyarı vermek/almak',
    'Emniyette hata',
    'Uygun olmayan hız',
    'Ekipman koruyucusu kullanmamak',
    'Kişisel koruyucu donanım kullanmamak',
    'Ekipman kullanım hatası',
    'Arızalı ekipman kullanmak',
    'Bilgisi olmadığı alanda çalışmak',
    'Talimatlara uymamak',
    'Yorgunluk/Uykusuzluk/Dalgınlık',
    'Disiplinsiz çalışma',
    'Yetersiz makine ekipman muhafazası',
  ];
}
