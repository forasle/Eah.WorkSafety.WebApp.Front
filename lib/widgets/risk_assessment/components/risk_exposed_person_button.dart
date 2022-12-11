import 'package:aeah_work_safety/widgets/risk_assessment/components/slider_for_risk_exposed.dart';
import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/risk_assessment/constants.dart';

class RiskExposedPersonButton extends StatefulWidget {
  final String text;

  const RiskExposedPersonButton({Key? key, required this.text}) : super(key: key);

  @override
  State<RiskExposedPersonButton> createState() => _RiskExposedPersonButtonState();
}

class _RiskExposedPersonButtonState extends State<RiskExposedPersonButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constant.padding,
      child: SizedBox(
        width: 100,
        height: 40,
        child: ElevatedButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Risk Skoru'),
              content: SizedBox(
                  height: 150,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('Şiddet '),
                          SliderForRiskExposed(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('Olasılık '),
                          SliderForRiskExposed(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('Sıklık '),
                          SliderForRiskExposed(),
                        ],
                      ),
                    ],
                  )),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'İptal'),
                  child: const Text('İptal'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'TAMAM'),
                  child: const Text('TAMAM'),
                ),
              ],
            ),
          ),
          child: Text(widget.text),
        ),
      ),
    );
  }
}
