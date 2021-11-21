import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Location {
  String name;
  double lat;
  double lon;
  String country;
  Location(
      {required this.lon,
      required this.lat,
      required this.country,
      required this.name});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);

  String? get formattedLocation {
    return "$name, $country";
  }
}
