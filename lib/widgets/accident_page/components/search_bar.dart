import 'package:flutter/material.dart';


class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (value) {
      },
      //validator: (value) {
      //},
      decoration: (const InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.person),
          hintText: 'Filtrele',
          labelText: 'Filtrelenecek Kelimeyi Yazınız')),
    );
  }
}
