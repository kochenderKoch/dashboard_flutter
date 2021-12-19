import 'dart:collection';

import 'package:dashboard_flutter/model/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  final List<NotificationModel> _items = [
    NotificationModel(
        date: "12.12.2021",
        title: "Update Machine 1",
        subtitile: "Update auf der Machine 1 - Neue Version 10.1.2",
        status: "INFO"),
    NotificationModel(
        date: "12.12.2021",
        title: "Update Machine 1",
        subtitile: "Update auf der Machine 1 - Neue Version 10.1.2",
        status: "INFO"),
    NotificationModel(
        date: "12.12.2021",
        title: "Update Machine 1",
        subtitile: "Update auf der Machine 1 - Neue Version 10.1.2",
        status: "INFO"),
    NotificationModel(
        date: "12.12.2021",
        title: "Update Machine 1",
        subtitile: "Update auf der Machine 1 - Neue Version 10.1.2",
        status: "INFO"),
    NotificationModel(
        date: "12.12.2021",
        title: "Update Machine 1",
        subtitile: "Update auf der Machine 1 - Neue Version 10.1.2",
        status: "INFO"),
    NotificationModel(
        date: "12.12.2021",
        title: "Update Machine 1",
        subtitile: "Update auf der Machine 1 - Neue Version 10.1.2",
        status: "INFO"),
  ];

  UnmodifiableListView<NotificationModel> get items =>
      UnmodifiableListView(_items);

  void add(NotificationModel newNotification) {
    _items.add(newNotification);
    notifyListeners();
  }

  void delete(NotificationModel removeNotification) {
    _items.remove(removeNotification);
    notifyListeners();
  }
}
