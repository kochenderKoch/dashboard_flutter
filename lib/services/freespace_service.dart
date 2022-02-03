import 'package:dashboard_flutter/constant.dart';
import 'package:dashboard_flutter/model/free_space_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FreeSpaceService {
  static Future<FreeSpaceModel> getFreeSpace() async {
    try {
      var response =
          await http.get(Uri.parse(API_URL + 'get_free_space'), headers: {
        //"Accept": "application/json",
        //"Access-Control_Allow_Origin": "*",
      });
      var _data = json.decode(response.body);

      return FreeSpaceModel(free_space: _data);
    } catch (e) {
      print(e);
      return FreeSpaceModel(free_space: -1);
    }
  }
}
