import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/search_provider.dart';
import 'package:weather_app/utils/app_routes_name.dart';
import 'package:weather_app/widgets/rectangle_container.dart';

class CitiesList extends StatelessWidget {
  const CitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<SearchProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.cities.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: RectangleContainer(
                  child: ListTile(
                    title: Text(provider.cities[index].toString()),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutesName.loadingPage,
                      );
                      provider.selectedCity(provider.cities[index].toString());
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
