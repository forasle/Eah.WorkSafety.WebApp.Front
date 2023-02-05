import 'package:aeah_work_safety/blocs/auth/screens/login.dart';
import 'package:aeah_work_safety/blocs/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
/*      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),*/
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Flexible(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_left),
            ),
          ),
          const Flexible(child: Icon(Icons.apartment)),
          const Flexible(flex: 3, child: Text(' Aeah İSG'))
        ]),
        actions: [
          Row(
            children: [
              const Icon(Icons.person),
              Center(
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserData) {
                      return Text(state.userResponse.username);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text('Şifre Değiştir'),
                ),
                PopupMenuItem(
                  child: const Text('Çıkış Yap'),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (BuildContext context) => const Login()), ModalRoute.withName('/'));
                  },
                ),
              ];
            },
          )
        ],
      ),
/*      drawer: const Padding(
        padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
        child: DrawerWidget(),
      ),*/
      body: Scrollbar(
          controller: verticalScrollController,
          child: SingleChildScrollView(
            controller: verticalScrollController,
            child: body,
          )),
    );
  }
}
