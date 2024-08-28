class CityModel {
  String? name;
  LocalNames? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  CityModel({
    this.name,
    this.localNames,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  CityModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    localNames = json['local_names'] != null
        ? LocalNames.fromJson(json['local_names'])
        : null;
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (localNames != null) {
      data['local_names'] = localNames!.toJson();
    }
    data['lat'] = lat;
    data['lon'] = lon;
    data['country'] = country;
    data['state'] = state;
    return data;
  }

  @override
  String toString() {
    return '$name';
  }
}

class LocalNames {
  String? ru;
  String? en;

  LocalNames({this.ru, this.en});

  LocalNames.fromJson(Map<String, dynamic> json) {
    ru = json['ru'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ru'] = ru;
    data['en'] = en;
    return data;
  }
}
