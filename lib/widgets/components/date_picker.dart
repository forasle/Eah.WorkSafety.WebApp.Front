import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({Key? key}) : super(key: key);

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  String _date = "Tarih";
  String _time = "Saat";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.white),
          onPressed: () {
            DatePicker.showDatePicker(context,
                theme: const DatePickerTheme(
                  containerHeight: 210.0,
                ),
                showTitleActions: true,
                minTime: DateTime(2021, 1, 1),
                maxTime: DateTime(2023, 12, 31), onConfirm: (date) {
              _date = '${date.year} - ${date.month} - ${date.day}';
              print('confirm $date');
              setState(() {});
            },
                //currentTime: DateTime.now(),

                locale: LocaleType.tr);
          },
          child: Container(
            //color: Colors.redAccent,
            alignment: Alignment.center,
            height: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.date_range,
                            size: 18.0,
                            color: Colors.black,
                          ),
                          Text(
                            " $_date",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          //color: Colors.white,
        ),
        SizedBox(
          width: 20.0,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.white),
          onPressed: () {
            DatePicker.showTimePicker(context,
                theme: DatePickerTheme(
                  containerHeight: 210.0,
                ),
                showTitleActions: true, onConfirm: (time) {
              _time = '${time.hour} : ${time.minute} : ${time.second}';
              print('confirm $time');
              setState(() {});
            }, locale: LocaleType.tr);
            setState(() {});
          },
          child: Container(
            // color: Colors.red,
            alignment: Alignment.center,
            height: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            size: 18.0,
                            color: Colors.black,
                          ),
                          Text(
                            " $_time",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
