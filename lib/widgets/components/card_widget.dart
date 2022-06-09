import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String cardText;
  final String cardSubText;
  final String cardDouble;
  final Color cardColor;
  const CardWidget({
    Key? key,
    required this.cardText,
    required this.cardDouble,
    required this.cardColor,
    required this.cardSubText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      margin: EdgeInsets.all(8),
      elevation: 20,
      child: Container(
        //width: double.infinity,
        //constraints: const BoxConstraints(
        //minWidth: 195,
        // minHeight: 100,
        //maxWidth: 225,
        //),
        width: 200,
        height: 115,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                cardDouble.toString(),
              ),
              Text(
                cardText,
                maxLines: 2,
                softWrap: true,
              ),
              Text(
                cardSubText,
                maxLines: 2,
                softWrap: true,
                style: TextStyle(overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
