// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$weatherForecastAtom =
      Atom(name: '_HomeController.weatherForecast', context: context);

  @override
  WeatherForecast? get weatherForecast {
    _$weatherForecastAtom.reportRead();
    return super.weatherForecast;
  }

  @override
  set weatherForecast(WeatherForecast? value) {
    _$weatherForecastAtom.reportWrite(value, super.weatherForecast, () {
      super.weatherForecast = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  @override
  String toString() {
    return '''
weatherForecast: ${weatherForecast},
isLoading: ${isLoading}
    ''';
  }
}
