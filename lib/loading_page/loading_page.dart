import 'package:flutter/material.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'dart:async';

import 'package:weather_app/utils/app_routes_name.dart';

class LoadingPage extends StatefulWidget {
  @override
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutesName.currentWeatherPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backGroundGradient),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
