import 'package:forecast/data/models/aggregate_forecast_model.dart';

abstract class ForecastRepository {
  Future<AggregateForecast> getAggregateForecast(double lat, double lon);
}
