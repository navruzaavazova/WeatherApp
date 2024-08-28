import 'package:flutter/material.dart';

import 'package:weather_app/search_page/widgets/cities_list.dart';
import 'package:weather_app/search_page/widgets/custom_text_field.dart';
import 'package:weather_app/utils/app_colors.dart';


class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          gradient: AppColors.backGroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              CustomTextField(),
              const SizedBox(height: 30),
              const CitiesList(),

            ],
          ),
        ),
      ),
    );
  }
}
