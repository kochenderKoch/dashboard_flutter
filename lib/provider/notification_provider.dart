import 'dart:collection';

import 'package:dashboard_flutter/model/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  final List<NotificationModel> _items = [];

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
