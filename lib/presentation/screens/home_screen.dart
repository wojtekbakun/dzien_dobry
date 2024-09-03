import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/models/weather.dart';
import 'package:dzien_dobry/presentation/widgets/plants/plants_panel.dart';
import 'package:dzien_dobry/presentation/widgets/weather/weather_panel.dart';
import 'package:dzien_dobry/repository/weather_repository.dart';
import 'package:dzien_dobry/service/weather_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final weatherRepo =
        WeatherRepository(WeatherService(baseUrl: "http://localhost:4000"));
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: FutureBuilder<Weather>(
          future: weatherRepo.getWeather(),
          builder: (context, snapshot) {
            debugPrint('snapshot: $snapshot');
            if (snapshot.connectionState == ConnectionState.done) {
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
                      const WeatherPanel(),
                      const PlantsPanel(),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No data available'));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Waiting for data'));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
