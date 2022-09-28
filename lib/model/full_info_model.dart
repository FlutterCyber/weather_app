import 'package:weather_app/model/part_info_model.dart';

class FullInfo {
  PartInfo weather;
  var wind_cdir;
  var rh;
  var pod;
  var timestamp_utc;
  var pres;
  var solar_rad;
  var ozone;
  var wind_gust_spd;
  var timestamp_local;
  var snow_depth;
  var clouds;
  var ts;
  var wind_spd;
  var pop;
  var wind_cdir_full;
  var slp;
  var dni;
  var dewpt;
  var snow;
  var uv;
  var wind_dir;
  var clouds_hi;
  var precip;
  var vis;
  var dhi;
  var app_temp;
  var datetime;
  var temp;
  var ghi;
  var clouds_mid;
  var clouds_low;

  FullInfo.fromJson(Map<String, dynamic> json)
      : wind_cdir = json['wind_cdir'],
        rh = json['rh'],
        pod = json['pod'],
        timestamp_utc = json['timestamp_utc'],
        pres = json['pres'],
        solar_rad = json['solar_rad'],
        ozone = json['ozone'],
        wind_gust_spd = json['wind_gust_spd'],
        timestamp_local = json['timestamp_local'],
        snow_depth = json['snow_depth'],
        clouds = json['clouds'],
        ts = json['ts'],
        wind_spd = json['wind_spd'],
        pop = json['pop'],
        wind_cdir_full = json['wind_cdir_full'],
        slp = json['slp'],
        dni = json['dni'],
        dewpt = json['dewpt'],
        snow = json['snow'],
        uv = json['uv'],
        wind_dir = json['wind_dir'],
        clouds_hi = json['clouds_hi'],
        precip = json['precip'],
        vis = json['vis'],
        dhi = json['dhi'],
        app_temp = json['app_temp'],
        datetime = json['datetime'],
        temp = json['temp'],
        ghi = json['ghi'],
        clouds_mid = json['clouds_mid'],
        clouds_low = json['clouds_low'],
        weather = PartInfo.fromJson(json['weather']);
}
