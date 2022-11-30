import 'package:flutter/material.dart';

class Constant {
  static const divider = Divider(indent: 50, endIndent: 50);
  static const padding = EdgeInsets.all(5);

  //components/notification_card_widget

  static final border = BorderRadius.circular(10);
  static const margin = EdgeInsets.all(15);
  static const borderRadius = BorderRadius.only(
    topRight: Radius.circular(10),
    topLeft: Radius.circular(10),
  );
  static const paddingOfCardWidget =EdgeInsets.all(18);

//components/punishment_notification_card_widget

static const punishmentCardBorderRadius = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(20),
    bottomLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
);
static const marginOfPunishmentCard = EdgeInsets.all(20);
}
