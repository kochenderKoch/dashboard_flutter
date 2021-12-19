import 'dart:convert';
import 'package:dashboard_flutter/model/notification_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<List<NotificationModel>> getNews() async {
    try {
      var response = await http.get(
          Uri.parse('http://127.0.0.1:8000/api/get_all_newsfeeds'),
          headers: {
            //"Accept": "application/json",
            //"Access-Control_Allow_Origin": "*",
          });
      var _data = json.decode(response.body);
      List<NotificationModel> _result = [];

      for (var _item in _data) {
        Map<String, dynamic> item = _item as Map<String, dynamic>;
        _result.add(
          NotificationModel(
            title: item["headline"],
            subtitile: item['content'],
            status: item["status"].toString(),
            date: item['timestamp'].toString(),
          ),
        );
      }

      return _result;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<String> addNews(NotificationModel nmodel) async {
    try {
      var response =
          await http.post(Uri.parse('http://127.0.0.1:80/api/add_newsfeed'),
              headers: {
                "Accept": "application/json",
                //"Access-Control_Allow_Origin": "*",
              },
              body: jsonEncode(nmodel));

      return "SUCCESS";
    } catch (e) {
      print(e);
      return "ERROR";
    }
  }
}
