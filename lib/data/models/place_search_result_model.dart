import 'package:json_annotation/json_annotation.dart';
part 'place_search_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PlaceSearchResult {
  List<Place> candidates;
  String status;
  PlaceSearchResult({required this.candidates, required this.status});

  factory PlaceSearchResult.fromJson(Map<String, dynamic> json) =>
      _$PlaceSearchResultFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceSearchResultToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Place {
  @JsonKey(name: "formatted_address")
  String formattedAddress;
  Geometry geometry;
  Place(
      {@JsonKey(name: "formatted_address") required this.formattedAddress,
      required this.geometry});

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Geometry {
  Location location;
  Geometry({required this.location});

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Location {
  double lat;
  double lng;
  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
