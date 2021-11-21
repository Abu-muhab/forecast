import 'package:forecast/data/models/aggregate_forecast_model.dart';
import 'package:forecast/domain/repositories/forecast_repository.dart';
import 'package:forecast/domain/usecases/usecase.dart';

class GetAggregateForecast
    implements UseCase<AggregateForecast, GetAggregateForecastParams> {
  final ForecastRepository repository;

  GetAggregateForecast(this.repository);

  @override
  Future<AggregateForecast> call(
      {required GetAggregateForecastParams params}) async {
    return await repository.getAggregateForecast(params.lat, params.lon);
  }
}

class GetAggregateForecastParams {
  final double lat;
  final double lon;

  GetAggregateForecastParams({required this.lat, required this.lon});
}
