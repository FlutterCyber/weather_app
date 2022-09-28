class PartInfo {
  String icon;
  int code;
  String description;

  PartInfo.fromJson(Map<String, dynamic> json)
      : icon = json['icon'],
        code = json['code'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'icon': icon,
        'code': code,
        'description': description,
      };
}
