import 'package:dio/dio.dart';
import 'package:forecast/data/models/aggregate_forecast_model.dart';
import 'package:retrofit/http.dart';

part 'forecast_rest_client.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5")
abstract class ForecastRestClient {
  factory ForecastRestClient(Dio dio, {String baseUrl}) = _ForecastRestClient;

  @GET("/onecall")
  Future<AggregateForecast> getAggregateForecast(@Query("lat") double lat,
      @Query("lon") double lon, @Query("appid") String apiKey);
}
