import 'package:dzien_dobry/presentation/widgets/weather/weather_dot_single.dart';
import 'package:flutter/material.dart';

class WeatherDots extends StatelessWidget {
  const WeatherDots({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        WeatherDotSingle(
          isActive: false,
        ),
        WeatherDotSingle(
          isActive: true,
        ),
        WeatherDotSingle(
          isActive: false,
        ),
        WeatherDotSingle(
          isActive: false,
        ),
      ],
    );
  }
}
