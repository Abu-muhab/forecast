import 'package:forecast/data/models/day_summary_forecast_model.dart';
import 'package:forecast/data/models/forecast_model.dart';
import 'package:forecast/data/models/location_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'aggregate_forecast_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AggregateForecast {
  Forecast? current;
  List<Forecast>? hourly;
  Location? location;
  List<DaySummaryForecast>? daily;

  AggregateForecast({this.daily, this.hourly, this.current, this.location});

  factory AggregateForecast.fromJson(Map<String, dynamic> json) =>
      _$AggregateForecastFromJson(json);

  Map<String, dynamic> toJson() => _$AggregateForecastToJson(this);
}
