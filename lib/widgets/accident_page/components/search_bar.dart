import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  String? _searchByUsername;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (searchByUser) {
        _searchByUsername = searchByUser;
      },
      //validator: (value) {
      //},
      decoration: (const InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.person),
          hintText: 'Kullanıcı Adı',
          labelText: 'Filtrelenecek Kullanıcının Adını Yazınız')),
    );
  }
}
