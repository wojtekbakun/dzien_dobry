import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/consts/shapes.dart';
import 'package:flutter/material.dart';

class WeatherDotSingle extends StatelessWidget {
  final bool isActive;
  const WeatherDotSingle({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.weatherDotsHorizontal,
      child: Container(
        width: 24,
        height: 8,
        decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).indicatorColor
              : Theme.of(context).cardColor,
          shape: BoxShape.rectangle,
          borderRadius: MyRadius.small,
        ),
      ),
    );
  }
}
