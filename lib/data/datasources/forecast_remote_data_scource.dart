import 'package:forecast/data/models/aggregate_forecast_model.dart';
import 'package:forecast/data/models/location_model.dart';
import 'package:forecast/data/network/forecast_rest_client.dart';

abstract class ForecastRemoteDataSource {
  Future<AggregateForecast> getAggregateForecast(double lat, double lon);
}

const String API_KEY = "660591836ec3ecb62d7152096a6026b5";

class ForecastRemoteDataSourceImpl implements ForecastRemoteDataSource {
  final ForecastRestClient forecastRestClient;

  ForecastRemoteDataSourceImpl({required this.forecastRestClient});

  @override
  Future<AggregateForecast> getAggregateForecast(double lat, double lon) async {
    List<Location> locations = await forecastRestClient
        .getLocationNameFromCoords(lat, lon, API_KEY, 1);
    AggregateForecast forecast =
        await forecastRestClient.getAggregateForecast(lat, lon, API_KEY);

    forecast.location = locations.first;

    return forecast;
  }
}
