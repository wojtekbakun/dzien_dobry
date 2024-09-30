import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/models/weather.dart';
import 'package:dzien_dobry/presentation/widgets/weather/conditions_card.dart';
import 'package:dzien_dobry/presentation/widgets/weather/weather_dots.dart';
import 'package:dzien_dobry/repository/weather_repository.dart';
import 'package:dzien_dobry/service/api_service.dart';
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
  const WeatherPanel({
    super.key,
  });

  @override
  State<WeatherPanel> createState() => _WeatherPanelState();
}

class _WeatherPanelState extends State<WeatherPanel> {
  WeatherField _selectedField = WeatherField.temperature;
  late Future<Weather> futureWeatherConditions;
  void _changeWeatherField() {
    setState(() {
      _selectedField = WeatherField
          .values[(_selectedField.index + 1) % WeatherField.values.length];
    });
  }

  String _getCurrentWeatherValue(final weatherConditions) {
    switch (_selectedField) {
      case WeatherField.temperature:
        return weatherConditions.temperature;
      case WeatherField.air:
        return weatherConditions.air;
      case WeatherField.specialConditions:
        return weatherConditions.specialConditions;
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
  void initState() {
    super.initState();
    futureWeatherConditions =
        WeatherRepository(ApiService(baseUrl: 'http://localhost:8000'))
            .getWeather();
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
          FutureBuilder(
              future: Future.delayed(const Duration(seconds: 1), () {
                return futureWeatherConditions;
              }),
              builder: (context, weatherConditions) {
                if (weatherConditions.hasData) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _changeWeatherField();
                        },
                        child: ConditionsCard(
                          text: _getCurrentWeatherValue(weatherConditions.data),
                          icon: _getCurrentIcon(),
                        ),
                      )
                    ],
                  );
                } else if (weatherConditions.hasError) {
                  return Center(
                    child: Padding(
                      padding: MyPaddings.symmetricHorizontal,
                      child: Text(
                        'Nie udało się pobrać informacji o pogodzie, spróbuj ponownie później. \n\nTreść błędu: ${weatherConditions.error}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                return const Center(
                  child: Padding(
                    padding: MyPaddings.symmetricVertical,
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
// Weather Cart
// Air Card
// Special Conditions Card
// Clothing Card