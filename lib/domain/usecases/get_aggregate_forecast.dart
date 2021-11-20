import 'package:flutter/material.dart';
import 'package:forecast/data/models/aggregate_forecast_model.dart';
import 'package:forecast/domain/repositories/forecast_repository.dart';
import 'package:forecast/domain/usecases/usecase.dart';

class GetAggregateForecast implements UseCase<AggregateForecast, Params> {
  final ForecastRepository repository;

  GetAggregateForecast(this.repository);

  @override
  Future<AggregateForecast> call({@required Params? params}) async {
    return await repository.getAggregateForecast(params!.lat, params.lon);
  }
}

class Params {
  final double lat;
  final double lon;

  Params({required this.lat, required this.lon});
}
