import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateAndTimePicker extends StatefulWidget {
  const DateAndTimePicker({
    Key? key,
  }) : super(key: key);

  @override
  State<DateAndTimePicker> createState() => _DateAndTimePicker();
}

class _DateAndTimePicker extends State<DateAndTimePicker> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      locale: const Locale('tr'),
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  Future _selectDateTime(BuildContext context) async {
    final date = await _selectDate(context);
    final time = await _selectTime(context);
    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  String getDate() {
    return DateFormat('MMM d, yyyy').format(selectedDate);
  }

  String getDateTime() {
    return DateFormat('yyyy-MM-dd HH: ss').format(dateTime);
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            //padding: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _selectDateTime(context);
                showDateTime = true;
              },
              child: const Text('Select Date and Time Picker'),
            ),
          ),
          showDateTime ? Center(child: Text(getDateTime())) : const SizedBox(),
        ],
      ),
    );
  }
}
