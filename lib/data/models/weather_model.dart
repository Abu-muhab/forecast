import 'package:json_annotation/json_annotation.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class Weather {
  int id;
  String description;
  String icon;
  Weather({required this.icon, required this.description, required this.id});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  String get imageUrl {
    return "https://openweathermap.org/img/wn/$icon@2x.png";
  }
}
