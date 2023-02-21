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
  static const sizedBox50W = SizedBox(
    width: 50,
  );

  static const sizedBox5W = SizedBox(
    width: 5,
  );

  static const sizedBox10W = SizedBox(
    width: 10,
  );

  static const sizedBox50H = SizedBox(
    height: 50,
  );


  static const sizedBox = SizedBox(
    width: 10,
  );

  static const padding20 = EdgeInsets.all(20.0);

  static const padding = EdgeInsets.all(8.0);

  static final textFormFieldBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: const BorderSide());

  static const sizedBox10H = SizedBox(
    height: 10,
  );

  static const sizedBox50 = SizedBox(
    height: 50,
  );

  static final textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
  );

  static const TextStyle alertDialogTextStyle = TextStyle(color: Colors.black, fontSize: 15);

  static final List<String> rootCauseAnalysisRequirement = [
    'Kök Neden Analizi Gereksinimi'
  ];
  static final List<String> status = [
    'Uygunsuzluk Durumu'
  ];

  static const List<DropdownMenuItem<String>> menuItemsForGender = [
    DropdownMenuItem(child: Text("Erkek"), value: "1"),
    DropdownMenuItem(child: Text("Kadın"), value: "2"),
  ];

  static const List<DropdownMenuItem<String>> menuItemsForDepartmentType = [
    DropdownMenuItem(child: Text("Acil"), value: "1"),
    DropdownMenuItem(child: Text("Kvc Yoğun Bakım"), value: "2"),
  ];

  static const List<DropdownMenuItem<String>> menuItemsForPreventiveActivities = [
    DropdownMenuItem(child: Text("Düzenleyici"), value: "1"),
    DropdownMenuItem(child: Text("Önleyici"), value: "2"),
  ];
}

class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
    context: context,
    useRootNavigator: false,
    barrierDismissible: false,
    builder: (_) => LoadingDialog(key: key),
  ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(12.0),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

Padding title(BuildContext context, String title) {
  return Padding(
    padding: Constant.padding,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    ),
  );
}

Padding subtitle({required String subtitle, required double height, required double width}) {
  return Padding(
    padding: Constant.padding,
    child: SizedBox(
      height: height,
      width: width,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          subtitle,
          textAlign: TextAlign.center,
          softWrap: true,
          overflow: TextOverflow.fade,
        ),
      ),
    ),
  );
}

