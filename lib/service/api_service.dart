import 'dart:convert';
import 'package:dzien_dobry/models/plant.dart';
import 'package:dzien_dobry/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<Weather> fetchWeather() async {
    final response = await http.get(Uri.parse('$baseUrl/weather'));
    if (response.statusCode == 200) {
      debugPrint(
          'response 200: ${Weather.fromJson(jsonDecode(response.body) as Map<String, dynamic>)} ');
      return Weather.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<List<Plant>> fetchPlants() async {
    final response = await http.get(Uri.parse('$baseUrl/plants/belmondo'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return Plant.fromJsonList(jsonList);
    } else {
      throw Exception('Failed to load plants');
    }
  }

  Future<void> addPlant(String name) async {
    final response = await http.post(
      Uri.parse('$baseUrl/plants'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'id': name}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add plant');
    }
  }
}
