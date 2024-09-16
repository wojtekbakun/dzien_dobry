import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/models/weather.dart';
import 'package:dzien_dobry/presentation/widgets/weather/conditions_card.dart';
import 'package:dzien_dobry/presentation/widgets/weather/weather_dots.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> weatherData = [
  {
    'icon': Icons.thermostat,
  },
  {
    'icon': Icons.air,
  },
  {
    'icon': Icons.cloud,
  },
  // {
  //   'icon': Icons.filter_tilt_shift_rounded,
  // },
];

enum WeatherField {
  temperature,
  air,
  specialConditions,
  // clothes,
}

class WeatherPanel extends StatefulWidget {
  final Weather weatherConditions;
  const WeatherPanel({super.key, required this.weatherConditions});

  @override
  State<WeatherPanel> createState() => _WeatherPanelState();
}

class _WeatherPanelState extends State<WeatherPanel> {
  WeatherField _selectedField = WeatherField.temperature;

  void _changeWeatherField() {
    setState(() {
      _selectedField = WeatherField
          .values[(_selectedField.index + 1) % WeatherField.values.length];
    });
  }

  String _getCurrentWeatherValue() {
    switch (_selectedField) {
      case WeatherField.temperature:
        return widget.weatherConditions.temperature;
      case WeatherField.air:
        return widget.weatherConditions.air;
      case WeatherField.specialConditions:
        return widget.weatherConditions.specialConditions;
      // case WeatherField.clothes:
      //   return widget.weatherConditions.clothes;
    }
  }

  IconData _getCurrentIcon() {
    switch (_selectedField) {
      case WeatherField.temperature:
        return Icons.wb_sunny;
      case WeatherField.air:
        return Icons.air;
      case WeatherField.specialConditions:
        return Icons.warning_amber_outlined;
      //  case WeatherField.clothes:
      //   return Icons.shield_rounded;
    }
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
                clickedIndex: _selectedField.index,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              _changeWeatherField();
            },
            child: ConditionsCard(
              text: _getCurrentWeatherValue(),
              icon: _getCurrentIcon(),
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