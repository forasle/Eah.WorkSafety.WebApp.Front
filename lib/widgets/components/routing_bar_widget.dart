import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';

class routingBarWidget extends StatelessWidget {
  final String pageName;
  final String routeName;
  const routingBarWidget({
    Key? key,
    required this.pageName,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          ModalRoute.of(context)!.settings.name != routeName
              ? Navigator.pushNamed(context, routeName)
              : null;
        },
        child: Text(pageName),
      ),
    );
  }
}
