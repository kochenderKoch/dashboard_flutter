import 'package:dashboard_flutter/Screens/News/widgets/notification_tile.dart';
import 'package:dashboard_flutter/model/notification_model.dart';
import 'package:dashboard_flutter/provider/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: Card(
              elevation: 8,
              child: ListView(
                children: _buildNotifications(context, notificationProvider),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> _buildNotifications(
    BuildContext context, NotificationProvider notificationProvider) {
  List<Widget> _notifications = [
    const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        "Benachrichtigungen:",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    )
  ];

  for (var item in notificationProvider.items) {
    _notifications.add(_buildNotification2(item));
  }
  return _notifications;
}

Widget _buildNotification(NotificationModel model) {
  return Card(
    elevation: 8,
    shape: const Border(left: BorderSide(color: Colors.red, width: 7)),
    child: ListTile(
      leading: const Icon(Icons.info),
      hoverColor: Colors.red,
      title: Text(
        model.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(model.subtitile),
      trailing: Text(model.date),
    ),
  );
}

Widget _buildNotification2(NotificationModel model) {
  return NotificationCard(model: model);
}
