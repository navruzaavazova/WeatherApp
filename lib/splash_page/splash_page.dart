import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/utils/app_icons.dart';
import 'package:weather_app/utils/app_string.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    splashing();
  }

  splashing() {
    Future.delayed(const Duration(seconds: 5), () => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffFEE3BC),
              Color(0xffF39876),
            ],
            transform: GradientRotation(-25),
            stops: [0, 1],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.splashScreenIcon.path,
              height: 250,
            ),
            const SizedBox(
              height: 32.5,
            ),
            const Text(
              AppString.weatherName,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xB3FFFFFF).withOpacity(.8),
                    width: 1,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: Text(
                    AppString.clickButton,
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.clickButtonTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
