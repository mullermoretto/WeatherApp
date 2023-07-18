

import 'package:weather/models/api_configuration/api_configuration.dart';

import '../../models/weather_forecast/weather_forecast.dart';

class HomeRepository {

  Future<WeatherForecast> fetchWeatherData(String city) async {
    final dynamic json;
    json = await ApiConfiguration().getJsonFromCityName(city);
    return WeatherForecast(jsonData: json);
  }
}
