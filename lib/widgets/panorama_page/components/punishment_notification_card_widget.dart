import 'package:aeah_work_safety/constants/panaroma/constants.dart';
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
      shape: Constant.punishmentCardBorderRadius,
      margin: Constant.marginOfPunishmentCard,
      elevation: 20,
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: Constant.borderRadius
              ),
              padding: Constant.paddingOfCardWidget,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.date_range),
                      Text(title),
                    ],
                  ),
                  Text('Toplam: $notificationCount')
                ],
              ),
            ),
            ExpansionTile(
              title: const Text('Uyarılar'),
              children: generalNotifications
                  .map(
                    (e) => ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.dangerous),
                      subtitle: Text(e),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 65),
          ],
        ),
      ),
    );
  }
}
