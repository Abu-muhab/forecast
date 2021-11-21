// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return Forecast(
    weather: (json['weather'] as List<dynamic>)
        .map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
    dt: json['dt'] as int,
    temp: (json['temp'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'weather': instance.weather.map((e) => e.toJson()).toList(),
    };
