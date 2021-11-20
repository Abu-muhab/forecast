// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_summary_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DaySummaryForecast _$DaySummaryForecastFromJson(Map<String, dynamic> json) {
  return DaySummaryForecast(
    weather: (json['weather'] as List<dynamic>)
        .map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
    dt: json['dt'] as int,
    temp: TempSummary.fromJson(json['temp'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DaySummaryForecastToJson(DaySummaryForecast instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'weather': instance.weather,
    };

TempSummary _$TempSummaryFromJson(Map<String, dynamic> json) {
  return TempSummary(
    max: (json['max'] as num).toDouble(),
    day: (json['day'] as num).toDouble(),
    eve: (json['eve'] as num).toDouble(),
    min: (json['min'] as num).toDouble(),
    morn: (json['morn'] as num).toDouble(),
    night: (json['night'] as num).toDouble(),
  );
}

Map<String, dynamic> _$TempSummaryToJson(TempSummary instance) =>
    <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
