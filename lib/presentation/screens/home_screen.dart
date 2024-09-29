import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/models/weather.dart';
import 'package:dzien_dobry/presentation/widgets/plants/plants_panel.dart';
import 'package:dzien_dobry/presentation/widgets/weather/weather_panel.dart';
import 'package:dzien_dobry/repository/weather_repository.dart';
import 'package:dzien_dobry/service/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Weather> futureWeatherConditions;

  @override
  void initState() {
    super.initState();
    futureWeatherConditions =
        WeatherRepository(ApiService(baseUrl: 'http://localhost:8000'))
            .getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: FutureBuilder<Weather>(
          future: futureWeatherConditions,
          builder: (context, weatherConditions) {
            if (weatherConditions.hasData) {
              return Padding(
                padding: MyPaddings.largeAll,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Dzień dobry!',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      WeatherPanel(
                        weatherConditions: weatherConditions.data!,
                      ),
                      const PlantsPanel(),
                    ],
                  ),
                ),
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
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
