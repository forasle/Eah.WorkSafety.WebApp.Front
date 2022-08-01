import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DateTest extends StatefulWidget {
  @override
  State<DateTest> createState() => _DateTestState();
}

class _DateTestState extends State<DateTest> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
      onPressed: () {
        DatePicker.showDateTimePicker(context, showTitleActions: true,
            onChanged: (value) {
          print('change $value in time zone ' +
              value.timeZoneOffset.inHours.toString());
        }, onConfirm: (value) {
          print('confirm $value');
        }, currentTime: DateTime.now(), locale: LocaleType.tr);
      },
      child: Text(
        'Tarih Seçmek İçin Tıklayın',
      ),
    );
  }
}
