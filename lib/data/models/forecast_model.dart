import 'package:forecast/data/models/weather_model.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'forecast_model.g.dart';

@JsonSerializable()
class Forecast {
  int dt;
  double temp;
  List<Weather> weather;
  Forecast({required this.weather, required this.dt, required this.temp});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastToJson(this);

  double get tempC {
    return temp - 273;
  }

  double get tempF {
    return (tempC * (9 / 5)) + 32;
  }

  DateTime get date {
    return DateTime.fromMillisecondsSinceEpoch(dt * 1000, isUtc: false);
  }

  String get formattedDate {
    return DateFormat.yMEd().format(date);
  }

  String get formattedTime {
    return DateFormat.jm().format(date);
  }
}
