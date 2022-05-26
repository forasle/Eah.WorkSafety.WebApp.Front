import 'package:aeah_work_safety/widgets/appBar/components/drawerWidget.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  const CustomScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController verticalScrollController = ScrollController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Flexible(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_left),
            ),
          ),
          Flexible(child: Icon(Icons.apartment)),
          Flexible(flex: 3, child: Text(' Aeah İSG'))
        ]),
        actions: [
          Row(
            children: [
              Icon(Icons.person),
              Center(
                child: Text(' Murat Doğan'),
              ),
            ],
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Hesabım'),
                ),
                PopupMenuItem(
                  child: Text('Görevlerim'),
                ),
                PopupMenuItem(
                  child: Text('Şifre Değiştir'),
                ),
                PopupMenuItem(
                  child: Text('Çıkış Yap'),
                ),
              ];
            },
          )
        ],
      ),
      drawer: const Padding(
        padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
        child: DrawerWidget(),
      ),
      body: Scrollbar(
          controller: verticalScrollController,
          child: SingleChildScrollView(
            controller: verticalScrollController,
            child: body,
          )),
    );
  }
}
