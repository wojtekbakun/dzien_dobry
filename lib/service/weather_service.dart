import 'dart:convert';
import 'package:dzien_dobry/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String baseUrl;

  WeatherService({required this.baseUrl});

  Future<Weather> getWeather() async {
    final response = await http.get(Uri.parse('$baseUrl/weather'));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
