import 'package:forecast/data/models/aggregate_forecast_model.dart';

abstract class ForecastLocalDataSource {
  Future<AggregateForecast> getLastAggregateForecast(double lat, double lon);

  Future<void> cacheAggregateForecast(AggregateForecast aggregateForecast);
}

class ForecastLocalDataSourceImpl implements ForecastLocalDataSource {
  @override
  Future<void> cacheAggregateForecast(AggregateForecast aggregateForecast) {
    // TODO: implement cacheAggregateForecast
    throw UnimplementedError();
  }

  @override
  Future<AggregateForecast> getLastAggregateForecast(double lat, double lon) {
    // TODO: implement getLastAggregateForecast
    throw UnimplementedError();
  }
}
