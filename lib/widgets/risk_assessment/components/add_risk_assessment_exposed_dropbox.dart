import 'package:aeah_work_safety/constants/constants.dart';
import 'package:flutter/material.dart';

class CheckBoxForExposedPerson extends StatefulWidget {
  const CheckBoxForExposedPerson({Key? key}) : super(key: key);

  @override
  State<CheckBoxForExposedPerson> createState() =>
      _CheckBoxForExposedPersonState();
}

class _CheckBoxForExposedPersonState extends State<CheckBoxForExposedPerson> {
  bool monVal = false;
  bool tuVal = false;
  bool wedVal = false;
  bool thurVal = false;
  bool friVal = false;
  bool satVal = false;
  bool sunVal = false;
  Widget checkbox(String title, bool boolValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool? value) {
            /// manage the state of each value
            setState(() {
              switch (title) {
                case "Doktor":
                  monVal = value!;
                  break;
                case "Hemşire":
                  tuVal = value!;
                  break;
                case "Sağlık Tek.":
                  wedVal = value!;
                  break;
                case "Refakatçi":
                  thurVal = value!;
                  break;
                case "Misafir":
                  friVal = value!;
                  break;
              }
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: <Widget>[
        Container(width: 100, child: checkbox("Doktor", monVal)),
        sizedBoxBetweenExposedPerson(),
        Container(width: 100, child: checkbox("Hemşire", tuVal)),
        sizedBoxBetweenExposedPerson(),
        Container(width: 100, child: checkbox("Sağlık Tek.", wedVal)),
        sizedBoxBetweenExposedPerson(),
        Container(width: 100, child: checkbox("Refakatçi", thurVal)),
        sizedBoxBetweenExposedPerson(),
        Container(width: 100, child: checkbox("Misafir", friVal)),
      ],
    );
  }
}
