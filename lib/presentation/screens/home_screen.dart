import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/presentation/widgets/plants/plants_panel.dart';
import 'package:dzien_dobry/presentation/widgets/weather/weather_panel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: MyPaddings.largeAll,
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
      ),
    );
  }
}
