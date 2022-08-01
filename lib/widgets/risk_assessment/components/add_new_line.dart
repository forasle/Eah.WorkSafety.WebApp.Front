import 'package:flutter/material.dart';

class DynamicWidget extends StatelessWidget {
  TextEditingController Product = new TextEditingController();
  TextEditingController Price = new TextEditingController();

  DynamicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
//      margin: new EdgeInsets.all(8.0),
      child: ListBody(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 200,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: new TextFormField(
                  controller: Product,
                  decoration: const InputDecoration(
                      labelText: 'Product Name', border: OutlineInputBorder()),
                ),
              ),
              Container(
                width: 100,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: new TextFormField(
                  controller: Price,
                  decoration: const InputDecoration(
                      labelText: 'Price', border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
