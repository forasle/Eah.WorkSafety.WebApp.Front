import 'package:flutter/material.dart';

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
      hint: Text('Lütfen Seçiniz'),
      items: widget.menuItems,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(),
        ),
      ),
    );
  }
}
