import 'package:dashboard_flutter/Screens/News/widgets/notification_tile.dart';
import 'package:dashboard_flutter/model/add_news_model.dart';
import 'package:dashboard_flutter/model/notification_model.dart';
import 'package:dashboard_flutter/provider/notification_provider.dart';
import 'package:dashboard_flutter/provider/role_provider.dart';
import 'package:dashboard_flutter/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final headlineController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    headlineController.addListener(() {});
    contentController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context);
    List<NotificationModel> notifications =
        Provider.of<List<NotificationModel>>(context);

    final roleProvider = Provider.of<RoleProvider>(context);
    final _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: Card(
              elevation: 8,
              child: ListView(
                children: _buildNotifications(context, notifications),
              ),
            ),
          ),
          roleProvider.roleModel.isAdmin()
              ? Card(
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: TextFormField(
                              controller: headlineController,
                              autofocus: true,
                              decoration: InputDecoration(
                                  labelText: 'Titel',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.red),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                            )),
                        SizedBox(
                          width: _width / 128,
                        ),
                        Flexible(
                            flex: 3,
                            child: TextFormField(
                              controller: contentController,
                              decoration: InputDecoration(
                                  labelText: 'Neue Nachricht',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.red),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                            )),
                        SizedBox(
                          width: _width / 128,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            sendNotification();
                          },
                          child: const Text("Abschicken"),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  void sendNotification() {
    NewsService.addNews(AddNewsModel(
        headline: headlineController.text,
        content: contentController.text,
        status: 0));
  }
}

List<Widget> _buildNotifications(
    BuildContext context, List<NotificationModel> notifications) {
  List<Widget> _notifications = [
    const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        "Benachrichtigungen:",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    )
  ];

  for (var item in notifications) {
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
      trailing: Text(model.readableTimestamp()),
    ),
  );
}

Widget _buildNotification2(NotificationModel model) {
  return NotificationCard(model: model);
}
