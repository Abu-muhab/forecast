import 'package:forecast/data/models/weather_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'forecast_model.g.dart';

@JsonSerializable()
class Forecast {
  int? dt;
  double? temp;
  List<Weather>? weather;
  Forecast({this.weather, this.dt, this.temp});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
