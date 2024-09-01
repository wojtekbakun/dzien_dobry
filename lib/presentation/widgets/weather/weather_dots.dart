import 'package:dzien_dobry/presentation/widgets/weather/weather_dot_single.dart';
import 'package:flutter/material.dart';

class WeatherDots extends StatelessWidget {
  final int clickedIndex;
  final int howManyDots;
  const WeatherDots({
    super.key,
    required this.howManyDots,
    required this.clickedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < howManyDots; i++)
          WeatherDotSingle(
            isActive: i == clickedIndex,
          ),
      ],
    );
  }
}
