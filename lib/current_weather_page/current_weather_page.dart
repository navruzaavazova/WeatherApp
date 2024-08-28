import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/current_weather_page/widgets/additional_info_container.dart';
import 'package:weather_app/providers/current_weather_provider.dart';
import 'package:weather_app/providers/search_provider.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/utils/app_icons.dart';
import 'package:weather_app/utils/app_routes_name.dart';
import 'package:weather_app/utils/app_string.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backGroundGradient,
        ),
        child: SafeArea(
          bottom: false,
          minimum: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ),
          child: Consumer2<CurrentWeatherProvider, SearchProvider>(
            builder: (context, currentWeatherProvider, searchProvider, child) {
              String cityName = searchProvider.selectedCityName.isNotEmpty
                  ? searchProvider.selectedCityName
                  : 'Fergana';
              currentWeatherProvider.weatherName(cityName);
              return ListView(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutesName.searchPage);
                      },
                      icon: SvgPicture.asset(
                        AppIcons.searchIcon.path,
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    cityName,
                    style: const TextStyle(
                      color: Color(0xff313341),
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    DateFormat.MMMEd().format(DateTime.now()),
                    style: const TextStyle(
                      color: Color(0xFF222229),
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppIcons.splashScreenIcon.path,
                        height: 185,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Column(
                          children: [
                            Text(
                              currentWeatherProvider.temp,
                              style: const TextStyle(
                                  color: Color(0xff313341),
                                  fontSize: 80,
                                  fontWeight: FontWeight.w700,
                                  height: 1.1),
                            ),
                            Text(
                              currentWeatherProvider.condition,
                              style: const TextStyle(
                                  color: Color(0xff313341),
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  height: 1.0),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        '°c',
                        style: TextStyle(
                            color: Color(0xff313341),
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            height: 1.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  AdditionalInfoContainer(
                      path: AppIcons.pressureIcon.path,
                      name: AppString.pressure,
                      value: '${currentWeatherProvider.pressure} hpa'),
                  AdditionalInfoContainer(
                      path: AppIcons.windIcon.path,
                      name: AppString.wind,
                      value: '${currentWeatherProvider.wind} m/s'),
                  AdditionalInfoContainer(
                      path: AppIcons.humidityIcon.path,
                      name: AppString.humidity,
                      value: '${currentWeatherProvider.humidity} %'),
                  const Row(
                    children: [
                      Row(
                        children: [
                          Text(AppString.today),
                          Text(AppString.tomorrow),
                        ],
                      )
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
