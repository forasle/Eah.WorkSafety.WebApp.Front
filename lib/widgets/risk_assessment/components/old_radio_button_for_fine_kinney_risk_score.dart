import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/risk_assessment/constants.dart';

class RadioGroupForFineKinneyScore extends StatefulWidget {
  const RadioGroupForFineKinneyScore({Key? key}) : super(key: key);

  @override
  RadioGroupForFineKinneyScoreWidget createState() =>
      RadioGroupForFineKinneyScoreWidget();
}

class RadioGroupForFineKinneyScoreWidget extends State {
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItemForSeverity = 'Birden Fazla Ölümlü Kaza';
  String radioButtonItemForProbability = 'Neredeyse Kesin';
  String radioButtonItemForFrequency =
      'Hemen Hemen Sürekli (Bir saatte birkaç defa)';

  // Group Value for Radio Button.
  int severity = 1;
  int probability = 11;
  int frequency = 21;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text('Şiddet'),
                  Wrap(
                    //alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: severity,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForSeverity =
                                'Birden Fazla Ölümlü Kaza';
                            severity = 1;
                          });
                        },
                      ),
                      const Text(
                        '100',
                      ),
                      Radio(
                        value: 2,
                        groupValue: severity,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForSeverity = 'Ölümlü Kaza';
                            severity = 2;
                          });
                        },
                      ),
                      const Text(
                        '40',
                      ),
                      Radio(
                        value: 3,
                        groupValue: severity,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForSeverity =
                                'Kalıcı Hasar/Yaralanma, İş Kaybı';
                            severity = 3;
                          });
                        },
                      ),
                      const Text(
                        '15',
                      ),
                      Radio(
                        value: 4,
                        groupValue: severity,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForSeverity =
                                'Önemli Hasar/Yaralanma, Dış İlk Yardım';
                            severity = 4;
                          });
                        },
                      ),
                      const Text(
                        '7',
                      ),
                      Radio(
                        value: 5,
                        groupValue: severity,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForSeverity =
                                'Küçük Hasar/Yaralanma, Dahili İlk Yardım';
                            severity = 5;
                          });
                        },
                      ),
                      const Text(
                        '3',
                      ),
                      Radio(
                        value: 6,
                        groupValue: severity,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForSeverity =
                                'Ucuz Atlatma, Ramak Kala';
                            severity = 6;
                          });
                        },
                      ),
                      const Text(
                        '1',
                      ),
                    ],
                  ),
                  Text(radioButtonItemForSeverity),
                ],
              ),
            ),
            Constant.sizedBox50W,
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text('Olasılık'),
                  Wrap(
                    //alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        value: 11,
                        groupValue: probability,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForProbability = 'Neredeyse Kesin';
                            probability = 11;
                          });
                        },
                      ),
                      const Text(
                        '10',
                      ),
                      Radio(
                        value: 12,
                        groupValue: probability,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForProbability = 'Kuvvetle Muhtemel';
                            probability = 12;
                          });
                        },
                      ),
                      const Text(
                        '6',
                      ),
                      Radio(
                        value: 13,
                        groupValue: probability,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForProbability =
                                'Olağandışı Ama Mümkün';
                            probability = 13;
                          });
                        },
                      ),
                      const Text(
                        '3',
                      ),
                      Radio(
                        value: 14,
                        groupValue: probability,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForProbability = 'Uzak İhtimal';
                            probability = 14;
                          });
                        },
                      ),
                      const Text(
                        '1',
                      ),
                      Radio(
                        value: 15,
                        groupValue: probability,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForProbability =
                                'Beklenmez Fakat Mümkün';
                            probability = 15;
                          });
                        },
                      ),
                      const Text(
                        '0.5',
                      ),
                      Radio(
                        value: 16,
                        groupValue: probability,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForProbability =
                                'Pratik Olarak İmkansız';
                            probability = 16;
                          });
                        },
                      ),
                      const Text(
                        '0.2',
                      ),
                    ],
                  ),
                  Text(radioButtonItemForProbability),
                ],
              ),
            ),
            Constant.sizedBox50W,
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text('Sıklık'),
                  Wrap(
                    //alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        value: 21,
                        groupValue: frequency,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForFrequency =
                                'Hemen Hemen Sürekli (Bir saatte birkaç defa)';
                            frequency = 21;
                          });
                        },
                      ),
                      const Text(
                        '10',
                      ),
                      Radio(
                        value: 22,
                        groupValue: frequency,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForFrequency =
                                'Sıklıkla (Günde bir veya birkaç defa )';
                            frequency = 22;
                          });
                        },
                      ),
                      const Text(
                        '6',
                      ),
                      Radio(
                        value: 23,
                        groupValue: frequency,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForFrequency =
                                'Ara Sıra (Haftada 1 veya birkaç defa)';
                            frequency = 23;
                          });
                        },
                      ),
                      const Text(
                        '3',
                      ),
                      Radio(
                        value: 24,
                        groupValue: frequency,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForFrequency =
                                'Seyrek (Ayda bir veya birkaç defa)';
                            frequency = 24;
                          });
                        },
                      ),
                      const Text(
                        '2',
                      ),
                      Radio(
                        value: 25,
                        groupValue: frequency,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForFrequency =
                                'Nadir (Yılda birkaç defa)';
                            frequency = 25;
                          });
                        },
                      ),
                      const Text(
                        '1',
                      ),
                      Radio(
                        value: 26,
                        groupValue: frequency,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItemForFrequency =
                                'Çok Nadir (Yılda bir veya daha az)';
                            frequency = 26;
                          });
                        },
                      ),
                      const Text(
                        '0.5',
                      ),
                    ],
                  ),
                  Text('$radioButtonItemForFrequency'),
                ],
              ),
            ),
            Constant.sizedBox50W
          ],
        ),
        Card(
          color: Colors.redAccent.shade700,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Tolerans Gösterilemez Risk : 10.000,00'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
