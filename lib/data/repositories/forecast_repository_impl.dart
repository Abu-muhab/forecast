import 'package:flutter/material.dart';
import 'package:forecast/data/datasources/forecast_local_data_source.dart';
import 'package:forecast/data/datasources/forecast_remote_data_scource.dart';
import 'package:forecast/data/models/aggregate_forecast_model.dart';
import 'package:forecast/data/network/network_info.dart';
import 'package:forecast/domain/repositories/forecast_repository.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final ForecastRemoteDataSource? forecastRemoteDataSource;
  final ForecastLocalDataSource? forecastLocalDataSource;
  final NetworkInfo? networkInfo;

  ForecastRepositoryImpl(
      {@required this.forecastLocalDataSource,
      @required this.forecastRemoteDataSource,
      @required this.networkInfo});

  @override
  Future<AggregateForecast> getAggregateForecast(double lat, double lon) async {
    if (await networkInfo!.isConnected) {
      print("connected");
      final aggregateForecast =
          await forecastRemoteDataSource!.getAggregateForecast(lat, lon);
      forecastLocalDataSource!.cacheAggregateForecast(aggregateForecast);
      return aggregateForecast;
    } else {
      print("not connected");
      return forecastLocalDataSource!.getLastAggregateForecast(lat, lon);
    }
  }
}
