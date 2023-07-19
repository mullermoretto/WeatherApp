
import 'package:mobx/mobx.dart';
import 'package:weather/models/location/location_provider.dart';
import 'package:weather/presentation/home/home_repository.dart';

import '../../models/weather_forecast/weather_forecast.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final HomeRepository repository;

  _HomeController({required this.repository});

  @observable
  WeatherForecast? weatherForecast;

  @observable
  bool isLoading = false;

  Future<void> getWeather() async {
    isLoading = true;
    String city = await LocationProvider().getCityFromLocation();
    weatherForecast = await repository.fetchWeatherData(city == "" ? "Itu": city);
    weatherForecast?.setColorWeather();
    isLoading = false;
  }

}
