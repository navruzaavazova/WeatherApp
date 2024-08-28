import 'package:intl/intl.dart';

class WeekWeatherModel {
  String? cod;
  int? message;
  int? cnt;
  List<Listies>? listies;
  City? city;

  WeekWeatherModel({this.cod, this.message, this.cnt, this.listies, this.city});

  WeekWeatherModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      listies = <Listies>[];
      json['list'].forEach((v) {
        listies!.add(Listies.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (listies != null) {
      data['list'] = listies!.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }

  String getTemperature(int index) {
    return listies![index].main!.temp.toString();
  }

  String getTimeHourly(int index) {
    DateTime dateTime = DateTime.parse(listies![index].dtTxt!);
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  String getDateDaily(int index) {
    DateTime dateTime = DateTime.parse(listies![index].dtTxt!);
    return DateFormat.EEEE().format(dateTime);
  }
}

class Listies {
  int? dt;
  Main? main;
  List<Weather>? weather;
  String? dtTxt;

  Listies({this.dt, this.main, this.weather, this.dtTxt});

  Listies.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['dt'] = dt;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['dt_txt'] = dtTxt;
    return data;
  }
}

class Main {
  double? temp;

  Main({this.temp});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['temp'] = temp;
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class City {
  int? id;
  String? name;
  String? country;

  City({this.id, this.name, this.country});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['country'] = country;
    return data;
  }
}
