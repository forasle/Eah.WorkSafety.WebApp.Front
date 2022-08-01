import 'package:flutter/material.dart';

class AddNewLine extends StatefulWidget {
  const AddNewLine({Key? key}) : super(key: key);

  @override
  _AddNewLineState createState() => _AddNewLineState();
}

class _AddNewLineState extends State<AddNewLine> {
  final List<Widget> _cardList = [];

  void _addCardWidget() {
    setState(() {
      _cardList.add(_card());
    });
  }

  Widget _card() {
    return Container(
      height: 80,
      margin: EdgeInsets.only(top: 5, left: 8, right: 8),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.orangeAccent[100],
      ),
      child: Center(
        child: ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 26,
            ),
          ),
          title: Text(
            "Freedom Fighter",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.deepPurple),
          ),
          subtitle: Text(
            'Freedom Fighter',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
          ),
          trailing: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('5',
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                    SizedBox(
                      width: 1,
                    ),
                    Icon(
                      Icons.access_alarms_outlined,
                      textDirection: TextDirection.rtl,
                      size: 20,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _addCardWidget,
              child: Icon(Icons.add),
            ),
            Center(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _cardList.length,
                  itemBuilder: (context, index) {
                    return _cardList[index];
                  }),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
