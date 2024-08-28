import 'package:flutter/material.dart';

class AppColors {
  static const clickButtonTextColor = Color(0xFF303345);
  static const backGroundGradient = LinearGradient(
    colors: [
      Color(0xffFEE3BC),
      Color(0xffF39876),
    ],
    transform: GradientRotation(-25),
    stops: [0, 1],
  );
}
