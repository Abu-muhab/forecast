// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aggregate_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AggregateForecast _$AggregateForecastFromJson(Map<String, dynamic> json) {
  return AggregateForecast(
    daily: (json['daily'] as List<dynamic>?)
        ?.map((e) => DaySummaryForecast.fromJson(e as Map<String, dynamic>))
        .toList(),
    hourly: (json['hourly'] as List<dynamic>?)
        ?.map((e) => Forecast.fromJson(e as Map<String, dynamic>))
        .toList(),
    current: json['current'] == null
        ? null
        : Forecast.fromJson(json['current'] as Map<String, dynamic>),
  )..location = json['location'] == null
      ? null
      : Location.fromJson(json['location'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AggregateForecastToJson(AggregateForecast instance) =>
    <String, dynamic>{
      'current': instance.current,
      'hourly': instance.hourly,
      'location': instance.location,
      'daily': instance.daily,
    };
