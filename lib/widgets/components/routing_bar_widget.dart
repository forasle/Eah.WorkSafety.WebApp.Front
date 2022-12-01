import 'package:aeah_work_safety/constants/components/constants.dart';
import 'package:flutter/material.dart';

class RoutingBarWidget extends StatelessWidget {
  final String pageName;
  final String routeName;
  const RoutingBarWidget({
    Key? key,
    required this.pageName,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constant.padding8,
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
