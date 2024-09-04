import 'package:dzien_dobry/models/weather.dart';
import 'package:dzien_dobry/service/api_service.dart';

class WeatherRepository {
  final ApiService _weatherService;

  WeatherRepository(this._weatherService);

  Future<Weather> getWeather() async {
    return _weatherService.fetchWeather();
  }
}
