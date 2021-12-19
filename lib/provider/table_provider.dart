import 'dart:collection';
import 'dart:convert';

import 'package:dashboard_flutter/model/timecheck_model.dart';

import 'package:flutter/material.dart';

class TableProvider extends ChangeNotifier {
  final List<TimecheckModel> _items = [];

  UnmodifiableListView<TimecheckModel> get items =>
      UnmodifiableListView(_items);

  void add(TimecheckModel newEntry) {
    _items.add(newEntry);
    notifyListeners();
  }

  void delete(TimecheckModel removeEntry) {
    _items.remove(removeEntry);
    notifyListeners();
  }

  void update(TimecheckModel oldEntry, TimecheckModel newEntry) {
    _items.contains(oldEntry)
        ? _items[_items.indexWhere((element) => element == oldEntry)] = newEntry
        : true;
    notifyListeners();
  }
}
