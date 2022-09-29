import 'package:weather_app/model/full_info_model.dart';


class InfoList {

  List<FullInfo> data;

  String city_name;
  var lon;
  String timezone;
  var lat;
  String country_code;
  String state_code;

  InfoList.fromJson(Map<String, dynamic> json)
      : city_name = json['city_name'],
        lon = json['lon'],
        timezone = json['timezone'],
        lat = json['lat'],
        country_code = json['country_code'],
        state_code = json['state_code'],
        data =
            List<FullInfo>.from(json['data'].map((x) => FullInfo.fromJson(x)));
}
