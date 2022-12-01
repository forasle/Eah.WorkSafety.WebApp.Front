import 'package:flutter/material.dart';

enum MethodType { fineKinneyMethod, matrixMethod }

class RiskAssessmentMethodType extends StatefulWidget {
  const RiskAssessmentMethodType({Key? key}) : super(key: key);

  @override
  State<RiskAssessmentMethodType> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<RiskAssessmentMethodType> {
  MethodType? _method = MethodType.fineKinneyMethod;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Fine Kinney Metodu'),
          leading: Radio<MethodType>(
            value: MethodType.fineKinneyMethod,
            groupValue: _method,
            onChanged: (MethodType? value) {
              setState(() {
                _method = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('5x5 Matrix Metodu'),
          leading: Radio<MethodType>(
            value: MethodType.matrixMethod,
            groupValue: _method,
            onChanged: (MethodType? value) {
              setState(() {
                _method = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
