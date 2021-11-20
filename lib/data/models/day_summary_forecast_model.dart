import 'package:forecast/data/models/weather_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'day_summary_forecast_model.g.dart';

@JsonSerializable()
class DaySummaryForecast {
  int? dt;
  TempSummary? temp;
  List<Weather>? weather;

  DaySummaryForecast({this.weather, this.dt, this.temp});

  factory DaySummaryForecast.fromJson(Map<String, dynamic> json) =>
      _$DaySummaryForecastFromJson(json);

  Map<String, dynamic> toJson() => _$DaySummaryForecastToJson(this);
}

@JsonSerializable()
class TempSummary {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  TempSummary({this.max, this.day, this.eve, this.min, this.morn, this.night});

  factory TempSummary.fromJson(Map<String, dynamic> json) =>
      _$TempSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$TempSummaryToJson(this);
}
