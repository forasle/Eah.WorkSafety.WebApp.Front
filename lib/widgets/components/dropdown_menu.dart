import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/components/constants.dart';

class DropdownMenu extends StatefulWidget {
  final List<DropdownMenuItem<String>> menuItems;

  const DropdownMenu({Key? key, required this.menuItems}) : super(key: key);

  @override
  State<DropdownMenu> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  String selectedValue = "1";

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: const Text('Lütfen Seçiniz'),
      items: widget.menuItems,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      decoration: InputDecoration(border: Constant.textFormFieldBorder),
    );
  }
}
