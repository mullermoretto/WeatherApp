import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/models/temperature/temperature.dart';
import 'package:weather/utils/colors_of_weather.dart';

class WeatherForecast {
  final String _city;
  final String _region;
  final Temperature _temperature;
  final Temperature _temperatureFeelsLike;
  final Temperature _temperatureForecastMinimum;
  final Temperature _temperatureForecastMaximum;
  final String _windDirection;
  final String _windSpeed;
  final String _condition;
  final String _conditionIcon;
  final String _sunrise;
  final String _sunset;
  final String _moonPhase;
  final bool _isDay;
  Color _backgroundColor = ColorsWeather.clearDay;

  WeatherForecast({
    required jsonData,
  }) : _city = jsonData["location"]["name"],
       _region = jsonData['location']['region'].toString(),
       _temperature = Temperature(value: jsonData['current']['temp_c']),
       _temperatureFeelsLike = Temperature(value: jsonData['current']['feelslike_c']),
       _temperatureForecastMinimum = Temperature(value: jsonData['forecast']['forecastday'][0]['day']['mintemp_c']),
       _temperatureForecastMaximum = Temperature(value: jsonData['forecast']['forecastday'][0]['day']['maxtemp_c'],  ),
       _windDirection = jsonData['current']['wind_dir'],
       _windSpeed = jsonData['forecast']['forecastday'][0]['day']['maxwind_kph'].toString(),
       _condition = jsonData['forecast']['forecastday'][0]['day']['condition']['text'].toString().toLowerCase(),
       _conditionIcon = jsonData['current']['condition']['icon'].toString().replaceAll("//", "http://"),
       _sunrise = jsonData['forecast']['forecastday'][0]['astro']['sunrise'].toString(),
       _sunset = jsonData['forecast']['forecastday'][0]['astro']['sunset'].toString(),
       _moonPhase = jsonData['forecast']['forecastday'][0]['astro']['moon_phase'].toString(),
       _isDay = jsonData['current']['is_day'].toString() == '1' ? true : false
  ;

  String get conditionIcon => _conditionIcon;

  String get city => _city;

  String get region => _region;

  Temperature get temperature => _temperature;

  Temperature get temperatureFeelsLike => _temperatureFeelsLike;

  Temperature get temperatureForecastMinimum => _temperatureForecastMinimum;

  Temperature get temperatureForecastMaximum => _temperatureForecastMaximum;

  Color get backgroundColor => _backgroundColor;

  String get sunrise => _sunrise;

  String get sunset => _sunset;

  String get moonPhase => getMoonPhase(_moonPhase);

  String get windDirection => getWindDirection(_windDirection);

  String get windSpeed => _windSpeed;


  void setColorWeather() {
      if (_condition.contains("sol")){
          _backgroundColor =
              _isDay ? ColorsWeather.clearDay : ColorsWeather.clearNight;
        }
      if (_condition.contains("nublado")){
          _backgroundColor =
              _isDay ? ColorsWeather.cloudyDay : ColorsWeather.cloudyNight;
        }
      if (_condition.contains( "chuva")){
          _backgroundColor =
              _isDay ? ColorsWeather.rainyDay : ColorsWeather.rainyNight;
        }
        if (_condition.contains( "neve")){
          _backgroundColor =
              _isDay ? ColorsWeather.snowDay : ColorsWeather.snowNight;
        }
  }

  String getMoonPhase(String moonPhase) {
    switch(moonPhase){
      case "New Moon":{return "Lua nova";}
      case "Waxing Crescent":{return "Crescente";}
      case "First Quarter":{return "Crescente";}
      case "Waxing Gibbous":{return "Crescente";}
      case "Full Moon":{return "Lua cheia";}
      case "Waning Gibbous":{return "Minguante";}
      case "Last Quarter":{return "Minguante";}
      case "Waning Crescent":{return "Minguante";}
    }
    return "Erro";
  }

  String getWindDirection(String windDirection) {
    switch(windDirection){
      case "N":{return "Norte";}
      case "NNE":{return "Nor-Nordeste";}
      case "NE":{return "Nordeste";}
      case "ENE":{return "Leste-Nordeste";}
      case "E":{return "Leste";}
      case "ESE":{return "Leste-Sudeste";}
      case "SE":{return "Sudeste";}
      case "SSE":{return "Sul-Sudeste";}
      case "S":{return "Sul";}
      case "SSW":{return "Sul-Sudoeste";}
      case "SW":{return "Sudoeste";}
      case "WSW":{return "Oeste-Sudoeste";}
      case "W":{return "Oeste";}
      case "WNW":{return "Oeste-Noroeste";}
      case "NW":{return "Noroeste";}
      case "NNW":{return "Nor-Noroeste";}
    }
    return "";
  }

}
