import 'package:flutter/material.dart';

class Weather {
  String temperature;
  String air;
  String specialConditions;
  String clothes;

  Weather({
    required this.temperature,
    required this.air,
    required this.specialConditions,
    required this.clothes,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> weatherData = json['data'];
    debugPrint(weatherData.toString());
    debugPrint(weatherData['temperature']);
    return switch (weatherData) {
      {
        'temperature': String temperature,
        'air': String air,
        'special_conditions': String specialConditions,
        'clothes': String clothes,
      } =>
        Weather(
          temperature: temperature,
          air: air,
          specialConditions: specialConditions,
          clothes: clothes,
        ),
      _ => throw const FormatException('Failed to load Weather Conditions')
    };
  }
}
