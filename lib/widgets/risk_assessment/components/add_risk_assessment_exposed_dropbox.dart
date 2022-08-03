import 'package:aeah_work_safety/constants/constants.dart';
import 'package:aeah_work_safety/widgets/risk_assessment/components/risk_exposed_person_button.dart';
import 'package:flutter/material.dart';

class CheckBoxForExposedPerson extends StatefulWidget {
  const CheckBoxForExposedPerson({Key? key}) : super(key: key);

  @override
  State<CheckBoxForExposedPerson> createState() =>
      _CheckBoxForExposedPersonState();
}

class _CheckBoxForExposedPersonState extends State<CheckBoxForExposedPerson> {
  bool doctor = false;
  bool nurse = false;
  bool medTech = false;
  bool companion = false;
  bool guest = false;

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
                  doctor = value!;
                  break;
                case "Hemşire":
                  nurse = value!;
                  break;
                case "Sağlık Tek.":
                  medTech = value!;
                  break;
                case "Refakatçı":
                  companion = value!;
                  break;
                case "Misafir":
                  guest = value!;
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
        Container(
          width: 100,
          child: Column(
            children: [
              checkbox("Doktor", doctor),
              ElevatedButton(onPressed: () {}, child: Text('Risk Skoru Ekle')),
            ],
          ),
        ),
        sizedBoxBetweenExposedPerson(),
        Container(width: 100, child: checkbox("Hemşire", nurse)),
        sizedBoxBetweenExposedPerson(),
        Container(width: 100, child: checkbox("Sağlık Tek.", medTech)),
        sizedBoxBetweenExposedPerson(),
        Container(width: 100, child: checkbox("Refakatçi", companion)),
        sizedBoxBetweenExposedPerson(),
        Container(width: 100, child: checkbox("Misafir", guest)),
      ],
    );
  }
}
