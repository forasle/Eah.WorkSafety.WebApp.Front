import 'package:aeah_work_safety/constants/components/constants.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;
  final String cardSubText;
  final dynamic cardDouble;
  final Color cardColor;
  final Icon cardSubIcon;
  final void Function()? customCardWidgetOnTap;

  const CustomCardWidget({
    Key? key,
    required this.cardIcon,
    required this.cardText,
    required this.cardDouble,
    required this.cardColor,
    required this.customCardWidgetOnTap,
    required this.cardSubText,
    required this.cardSubIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      margin: Constant.padding8,
      elevation: 20,
      child: SizedBox(
        //constraints: const BoxConstraints(minWidth: 195, minHeight: 100),
        width: 200,
        height: 110,
        child: InkWell(
          splashColor: Colors.black26,
          onTap: customCardWidgetOnTap,
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: Constant.padding8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    cardIcon,
                    size: 60,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          cardDouble.toString(),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          cardText,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  cardSubText,
                  maxLines: 2,
                  softWrap: true,
                ),
                cardSubIcon
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
