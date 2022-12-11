import 'package:flutter/material.dart';

class SliderForRiskExposed extends StatefulWidget {
  const SliderForRiskExposed({Key? key}) : super(key: key);

  @override
  State<SliderForRiskExposed> createState() => _SliderForRiskExposedState();
}

class _SliderForRiskExposedState extends State<SliderForRiskExposed> {
  double _value = 1;

  @override
  Widget build(BuildContext context) {
    return Slider(
        min: 0.0,
        max: 100.0,
        value: _value,
        divisions: 10,
        label: '${_value.round()}',
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        });
  }
}
