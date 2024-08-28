import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/widgets/rectangle_container.dart';

class AdditionalInfoContainer extends StatelessWidget {
  const AdditionalInfoContainer({
    super.key,
    required this.path,
    required this.name,
    required this.value,
  });
  final String path;
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: RectangleContainer(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    path,
                    height: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Color(0xff303345),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Text(value),
            ],
          ),
        ),
      ),
    );
  }
}
