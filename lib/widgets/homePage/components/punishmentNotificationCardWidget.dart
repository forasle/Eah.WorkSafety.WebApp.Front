import 'package:flutter/material.dart';

class PunishmentNotificationCardWidget extends StatelessWidget {
  final Color color;
  final String title;
  final String notificationCount;
  final List<String> generalNotifications;
  const PunishmentNotificationCardWidget({
    Key? key,
    required this.color,
    required this.title,
    required this.notificationCount,
    required this.generalNotifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(80),
          bottomLeft: Radius.circular(70),
          topRight: Radius.circular(40),
        ),
      ),
      margin: EdgeInsets.all(20),
      elevation: 20,
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.date_range),
                      Text(title),
                    ],
                  ),
                  Text('Toplam: $notificationCount')
                ],
              ),
            ),
            ExpansionTile(
              title: Text('Uyarılar'),
              children: generalNotifications
                  .map(
                    (e) => ListTile(
                      onTap: () {},
                      leading: Icon(Icons.dangerous),
                      subtitle: Text(e),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 65),
          ],
        ),
      ),
    );
  }
}
