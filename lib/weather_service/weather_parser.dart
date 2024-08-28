import 'package:dio/dio.dart';
import 'package:weather_app/utils/weather_mode.dart';
import 'package:weather_app/weather_service/city_model.dart';
import 'package:weather_app/weather_service/weather_model.dart';
import 'package:weather_app/weather_service/week_weather_model.dart';

class WeatherParser {
  String apiKey = 'aaf1c7acee10cea938a859d888778520';
  final String cityName;
  Map<String, String> dateTime = {};
  Dio dio = Dio();
  String currentWeatherApi = 'https://api.openweathermap.org/data/2.5/weather?';
  String listCitiesApi = 'http://api.openweathermap.org/geo/1.0/direct?';
  String weekWeatherApi = 'https://api.openweathermap.org/data/2.5/forecast?';

  WeatherParser({
    required this.cityName,
  });
  Future getWeather() async {
    final result = await dio.get(currentWeatherApi, queryParameters: {
      'q': cityName,
      'appid': apiKey,
      'units': 'metric',
    });
    if (result.statusCode == 200) {
      WeatherModel model = WeatherModel.fromJson(result.data);
      return {
        WeatherMode.name: model.name ?? '',
        WeatherMode.temp: model.main?.temp?.toInt().toString(),
        WeatherMode.condition: model.weather?.first.main ?? '',
        WeatherMode.humidity: model.main!.humidity.toString(),
        WeatherMode.wind: model.wind!.speed.toString(),
        WeatherMode.pressure: model.main!.pressure.toString(),
      };
    } else {
      throw Exception('Failed the load weather');
    }
  }

  Future<List<CityModel>> getCitieslist() async {
    final response = await dio.get(listCitiesApi, queryParameters: {
      'q': cityName,
      'limit': 5,
      'appid': apiKey,
    });
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      List<CityModel> cities =
          data.map((city) => CityModel.fromJson(city)).toList();
      return cities;
    } else {
      throw Exception('failed the load cities');
    }
  }

  Future getHourlyWeather() async {}

  Future<void> getWeekWeather() async {
    final response = await dio.get(weekWeatherApi, queryParameters: {
      'q': cityName,
      'appid': apiKey,
      'units': 'metric',
    });

    if (response.statusCode == 200) {
      WeekWeatherModel model = WeekWeatherModel.fromJson(response.data);

      for (int i = 0; i < model.listies!.length; i++) {
        String time = model.getTimeHourly(i);
        String temp = model.getTemperature(i);

        dateTime[time] = temp;
      }
    }
  }
}

void main() async {
  var parser = await WeatherParser(cityName: 'Fergana');
  await parser.getWeekWeather();
  print(parser.dateTime);
}
