import 'package:aeah_work_safety/constants/routes.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;
  final double cardDouble;
  final Color cardColor;
  final void Function()? customCardWidgetOnTap;
  const CustomCardWidget({
    Key? key,
    required this.cardIcon,
    required this.cardText,
    required this.cardDouble,
    required this.cardColor,
    required this.customCardWidgetOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      margin: EdgeInsets.all(8),
      elevation: 20,
      child: Container(
        constraints: BoxConstraints(minWidth: 195, minHeight: 100),
        //width: 195,
        //height: 100,
        child: InkWell(
          splashColor: Colors.black26,
          onTap: customCardWidgetOnTap,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        cardIcon,
                        size: 60,
                      ),
                      Column(
                        children: [
                          Text(
                            cardDouble.toString(),
                          ),
                          const SizedBox(height: 20),
                          Text(cardText),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Detay İçin Tıklayınız'),
                    Icon(Icons.arrow_right)
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
