import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/model/info_list.dart';

import '../model/info_one.dart';

class Network {
  static String BASE = "weatherbit-v1-mashape.p.rapidapi.com";
  static Map<String, String> headers = {
    'X-RapidAPI-Key': '1bdbd25d3amsh58402ed0276cd8dp105f38jsn45572d409397',
    'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com'
  };

  static String API = "/forecast/3hourly";

  static Future GET(String api, Map<String, String> params) async {
    print(api);
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */
  static Map<String, String> paramsGet() {
    Map<String, String> params = new Map();
    params.addAll({
      'lat': "35.5",
      'lon': "-78.5",
    });
    return params;
  }

  // HTTP parsing
  static parseList(String body) {
    dynamic json = jsonDecode(body);
    var data1 = InfoList.fromJson(json);
    return data1;
  }

  static parseOne(String body) {
    dynamic json = jsonDecode(body);
    var data = InfoOne.fromJson(json);
    return data;
  }

}
