import 'dart:convert';

import 'package:forecast/data/models/aggregate_forecast_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ForecastLocalDataSource {
  Future<AggregateForecast?> getLastAggregateForecast(double lat, double lon);

  Future<void> cacheAggregateForecast(AggregateForecast aggregateForecast);
}

class ForecastLocalDataSourceImpl implements ForecastLocalDataSource {
  final SharedPreferences sharedPreferences;
  ForecastLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheAggregateForecast(
      AggregateForecast aggregateForecast) async {
    await sharedPreferences.setString(
        "lastForecast", json.encode(aggregateForecast.toJson()));
  }

  @override
  Future<AggregateForecast?> getLastAggregateForecast(
      double lat, double lon) async {
    String? jsonString = sharedPreferences.getString("lastForecast");
    if (jsonString != null) {
      AggregateForecast aggregateForecast =
          AggregateForecast.fromJson(json.decode(jsonString));
      return aggregateForecast;
    }
  }
}
