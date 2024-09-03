import 'package:dzien_dobry/models/weather.dart';
import 'package:dzien_dobry/service/weather_service.dart';

class WeatherRepository {
  final WeatherService _weatherService;

  WeatherRepository(this._weatherService);

  Future<Weather> getWeather() async {
    return _weatherService.getWeather();
  }
}
