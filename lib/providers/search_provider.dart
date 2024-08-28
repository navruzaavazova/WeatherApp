import 'package:flutter/material.dart';
import 'package:weather_app/weather_service/city_model.dart';
import 'package:weather_app/weather_service/weather_parser.dart';

class SearchProvider with ChangeNotifier {
  String _cityName = '';
  bool isLoading = false;
  List<CityModel> cities = [];
  String selectedCityName = '';

  String get cityName => _cityName;

  set cityName(String value) {
    _cityName = value;
    notifyListeners();
  }

  Future<void> searchResult() async {
    isLoading = true;
    notifyListeners();

    try {
      List<CityModel> result =
          await WeatherParser(cityName: cityName).getCitieslist();
      result = result.toSet().toList();

      cities = result.where((city) => city.name!.length > 2).toList();
    } catch (e) {
      print('Failed on provider');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void selectedCity(String city) {
    selectedCityName = city;
    notifyListeners();
  }
}
