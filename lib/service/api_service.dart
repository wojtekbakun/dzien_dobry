import 'dart:convert';
import 'dart:io';
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
      return Weather.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<List<Plant>> fetchPlants() async {
    final response = await http.get(Uri.parse('$baseUrl/plants'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return Plant.fromJsonList(jsonList);
    } else {
      throw Exception('Failed to load plants: ${response.statusCode}');
    }
  }

  Future<http.StreamedResponse> addPlant(String name, File imageFile) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/plants'));
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));
    request.fields['name'] = name;
    request.headers.addAll(
      <String, String>{
        'Content-Type': 'multipart/form-data',
      },
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      debugPrint('Plant added');
      return response;
    } else {
      throw Exception('Failed to add plant: ${response.statusCode}');
    }
  }
}
