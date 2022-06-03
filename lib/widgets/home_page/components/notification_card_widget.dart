import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(15),
      elevation: 20,
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
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
                      Text(date),
                    ],
                  ),
                  Text('Toplam: $notificationCount')
                ],
              ),
            ),
            ExpansionTile(
              title: Text('Eğitim Uyarıları'),
              children: educationNotifications
                  .map(
                    (e) => ListTile(
                      onTap: () {},
                      leading: Icon(Icons.dangerous),
                      subtitle: Text(e),
                    ),
                  )
                  .toList(),
            ),
            ExpansionTile(
                title: Text('Aksiyon Uyarıları'),
                children: actionNotifications
                    .map(
                      (e) => ListTile(
                        onTap: () {},
                        leading: Icon(Icons.dangerous),
                        subtitle: Text(e),
                      ),
                    )
                    .toList()),
            ExpansionTile(
              title: Text('Döküman Uyarıları'),
              children: documentNotifications
                  .map(
                    (e) => ListTile(
                      onTap: () {},
                      leading: Icon(Icons.dangerous),
                      subtitle: Text(e),
                    ),
                  )
                  .toList(),
            ),
            ExpansionTile(
              title: Text('Çalışan Uyarıları'),
              children: workerNotifications
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
