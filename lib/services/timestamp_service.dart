import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dashboard_flutter/model/timecheck_model.dart';

class TimestampService {
  Future<List<TimecheckModel>> getTimestamps() async {
    try {
      var response = await http
          .get(Uri.parse('http://127.0.0.1:8000/api/datecontrol'), headers: {
        //"Accept": "application/json",
        //"Access-Control_Allow_Origin": "*",
      });

      var _data = jsonDecode(response.body) as List;
      List<TimecheckModel> _result = [];

      for (var item in _data) {
        _result.add(TimecheckModel.fromJson(item));
      }

      return _result;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
