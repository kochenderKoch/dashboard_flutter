import 'dart:collection';

import 'package:dashboard_flutter/model/table_entry_model.dart';
import 'package:flutter/material.dart';

class TableProvider extends ChangeNotifier {
  final List<TableEntryModel> _items = [
    TableEntryModel(
        name: "123456",
        path: "C:\\Windows\\system32\\log4j.jar",
        date: "10.12.2021",
        status: "OK",
        size: "1,2 GB"),
    TableEntryModel(
        name: "476378",
        path: "C:\\Programme\\Datei1.txt",
        date: "10.10.2021",
        status: "WARNING",
        size: "2,3GB"),
    TableEntryModel(
        name: "389334",
        path: "C:\\Users\\user01\\Desktop\\bigFile100.ghm",
        date: "10.11.2021",
        status: "OK",
        size: " 700 MB"),
    TableEntryModel(
        name: "398729",
        path: "C:\\Container",
        date: "10.03.2021",
        status: "ERROR",
        size: "10,3GB"),
  ];

  UnmodifiableListView<TableEntryModel> get items =>
      UnmodifiableListView(_items);

  void add(TableEntryModel newEntry) {
    _items.add(newEntry);
    notifyListeners();
  }

  void delete(TableEntryModel removeEntry) {
    _items.remove(removeEntry);
    notifyListeners();
  }

  void update(TableEntryModel oldEntry, TableEntryModel newEntry) {
    _items.contains(oldEntry)
        ? _items[_items.indexWhere((element) => element == oldEntry)] = newEntry
        : true;
    notifyListeners();
  }
}
