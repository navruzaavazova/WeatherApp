import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/current_weather_page/current_weather_page.dart';
import 'package:weather_app/providers/current_weather_provider.dart';
import 'package:weather_app/providers/search_provider.dart';
import 'package:weather_app/utils/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CurrentWeatherProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: const Color(0xffF39876),
        ),
        home: CurrentWeatherPage(),
        routes: AppRoutes.routes,
      ),
    );
  }
}
