
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../utils/environment.dart';


class ApiConfiguration {
  final String _urlBase = "https://api.weatherapi.com/v1/forecast.json";
  final String _apiKey = Environment.personalKeyWeatherApi;



  dynamic getJsonFromCityName(String city) async {
    final dio = Dio();

    try {
      final response = await dio.get(
        _urlBase,
        queryParameters: {
          'key': _apiKey,
          'q': city,
          'lang': 'pt',
        },
      );
      //Todo: error control
      if (response.statusCode == 200) {
        return response.data;
      } //else {}
    } catch (error) {
      if (kDebugMode) {
        print('Error Catch: $error : ');
      }
      return null;
    }

  }

}