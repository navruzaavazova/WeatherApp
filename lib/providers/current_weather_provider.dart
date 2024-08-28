import 'package:flutter/material.dart';
import 'package:weather_app/utils/weather_mode.dart';
import 'package:weather_app/weather_service/weather_parser.dart';

class CurrentWeatherProvider with ChangeNotifier {
  String temp = '';
  String condition = '';
  String pressure = '';
  String wind = '';
  String humidity = '';

  void weatherName(String name) async {
    try {
      final weatherData = await WeatherParser(cityName: name).getWeather();

      condition = weatherData[WeatherMode.condition] ?? '';
      temp = weatherData[WeatherMode.temp] ?? '';
      pressure = weatherData[WeatherMode.pressure] ?? '';
      wind = weatherData[WeatherMode.wind] ?? '';
      humidity = weatherData[WeatherMode.humidity] ?? '';

      notifyListeners();
    } catch (e) {
      // throw Exception('Error fetching weather: $e');
    }
  }
}
