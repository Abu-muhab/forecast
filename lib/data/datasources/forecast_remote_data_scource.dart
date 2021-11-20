import 'package:flutter/cupertino.dart';
import 'package:forecast/data/models/aggregate_forecast_model.dart';
import 'package:forecast/data/network/forecast_rest_client.dart';

abstract class ForecastRemoteDataSource {
  Future<AggregateForecast> getAggregateForecast(double lat, double lon);
}

class ForecastRemoteDataSourceImpl implements ForecastRemoteDataSource {
  final ForecastRestClient? forecastRestClient;

  ForecastRemoteDataSourceImpl({@required this.forecastRestClient});

  @override
  Future<AggregateForecast> getAggregateForecast(double lat, double lon) {
    return forecastRestClient!.getAggregateForecast(lat, lon);
  }
}
