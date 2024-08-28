import 'package:flutter/material.dart';
import 'package:weather_app/loading_page/loading_page.dart';
import 'package:weather_app/search_page/search_page.dart';
import 'package:weather_app/utils/app_routes_name.dart';
import 'package:weather_app/current_weather_page/current_weather_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    AppRoutesName.searchPage: (context) => SearchPage(),
    AppRoutesName.currentWeatherPage: (context) => CurrentWeatherPage(),
    AppRoutesName.loadingPage: (context) => LoadingPage(),

  };
}
