import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/search_provider.dart';
import 'package:weather_app/utils/app_icons.dart';
import 'package:weather_app/utils/app_string.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var searchProvider = context.read<SearchProvider>();
    controller.addListener(() {
      final value = controller.text;
      searchProvider.cityName = value;
      searchProvider.searchResult();
    });
    return Container(
      height: 65,
      decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white54, width: 3),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                blurStyle: BlurStyle.outer)
          ]),
      child: Consumer<SearchProvider>(builder: (context, provider, child) {
        return TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: AppString.labelSearchText,
            labelStyle: const TextStyle(
              color: Color(0xff848484),
              fontSize: 14,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 5, left: 5),
              child: SvgPicture.asset(
                AppIcons.searchIcon.path,
              ),
            ),
            border: InputBorder.none,
            suffixIcon: provider.isLoading
                ? const Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 10,
                      height: 10,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white,
                      ),
                    ),
                  )
                : null,
          ),
          cursorColor: Colors.black54,
        );
      }),
    );
  }
}
