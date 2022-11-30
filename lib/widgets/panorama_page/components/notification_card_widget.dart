import 'package:flutter/material.dart';
import 'package:aeah_work_safety/constants/panaroma/constants.dart';

class NotificationCardWidget extends StatelessWidget {
  final Color color;
  final String date;
  final double notificationCount;
  final List<String> educationNotifications;
  final List<String> actionNotifications;
  final List<String> documentNotifications;
  final List<String> workerNotifications;
  const NotificationCardWidget({
    Key? key,
    required this.color,
    required this.date,
    required this.notificationCount,
    required this.educationNotifications,
    required this.actionNotifications,
    required this.documentNotifications,
    required this.workerNotifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: Constant.border,
      ),
      margin: Constant.margin,
      elevation: 20,
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: color, borderRadius: Constant.borderRadius),
              padding: Constant.paddingOfCardWidget,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.date_range),
                      Text(date),
                    ],
                  ),
                  Text('Toplam: $notificationCount')
                ],
              ),
            ),
            ExpansionTile(
              title: const Text('Eğitim Uyarıları'),
              children: educationNotifications
                  .map(
                    (e) => ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.dangerous),
                      subtitle: Text(e),
                    ),
                  )
                  .toList(),
            ),
            ExpansionTile(
                title: const Text('Aksiyon Uyarıları'),
                children: actionNotifications
                    .map(
                      (e) => ListTile(
                        onTap: () {},
                        leading: const Icon(Icons.dangerous),
                        subtitle: Text(e),
                      ),
                    )
                    .toList()),
            ExpansionTile(
              title: const Text('Döküman Uyarıları'),
              children: documentNotifications
                  .map(
                    (e) => ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.dangerous),
                      subtitle: Text(e),
                    ),
                  )
                  .toList(),
            ),
            ExpansionTile(
              title: const Text('Çalışan Uyarıları'),
              children: workerNotifications
                  .map(
                    (e) => ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.dangerous),
                      subtitle: Text(e),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
