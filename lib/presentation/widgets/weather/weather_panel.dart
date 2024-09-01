import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/presentation/widgets/weather/conditions_card.dart';
import 'package:dzien_dobry/presentation/widgets/weather/weather_dots.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> weatherData = [
  {
    'text': 'Około 12 będzie padało, więc weź parasolkę.',
    'icon': Icons.wb_sunny,
  },
  {
    'text': 'Powietrze jest czyściutkie i pachnące.',
    'icon': Icons.air,
  },
  {
    'text': 'Brzoza pyli, więc uważaj na alergie.',
    'icon': Icons.space_bar,
  },
  {
    'text': 'Dziś będzie bardzo zimno, weź ciepłą kurtkę.',
    'icon': Icons.filter_tilt_shift_rounded,
  },
];

class WeatherPanel extends StatefulWidget {
  const WeatherPanel({super.key});

  @override
  State<WeatherPanel> createState() => _WeatherPanelState();
}

class _WeatherPanelState extends State<WeatherPanel> {
  int index = 0;
  void getWeatherData(int clickedIndex) {
    setState(() {
      index = clickedIndex;
    });
  }

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
              WeatherDots(
                howManyDots: weatherData.length,
                clickedIndex: index,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              if (index == weatherData.length - 1) {
                getWeatherData(0);
              } else {
                getWeatherData(index + 1);
              }
            },
            child: ConditionsCard(
              text: weatherData[index]['text'],
              icon: weatherData[index]['icon'],
            ),
          )
        ],
      ),
    );
  }
}
// Weather Cart
// Air Card
// Special Conditions Card
// Clothing Card