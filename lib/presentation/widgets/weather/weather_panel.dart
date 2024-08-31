import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/presentation/widgets/weather/weather_card.dart';
import 'package:dzien_dobry/presentation/widgets/weather/weather_dots.dart';
import 'package:flutter/material.dart';

class WeatherPanel extends StatelessWidget {
  const WeatherPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.onlyTop,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Pogoda',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Expanded(child: Row()),
              const WeatherDots(),
            ],
          ),
          GestureDetector(
            onHorizontalDragEnd: (details) {},
            child: WeatherCard(),
          )
        ],
      ),
    );
  }
}
