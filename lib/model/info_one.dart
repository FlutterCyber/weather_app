import 'package:weather_app/model/full_info_model.dart';

class InfoOne {
  FullInfo data2;

  InfoOne.fromJson(Map<String, dynamic> json)
      : data2 = FullInfo.fromJson(json['data2']);
}
