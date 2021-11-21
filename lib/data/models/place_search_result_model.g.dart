// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceSearchResult _$PlaceSearchResultFromJson(Map<String, dynamic> json) {
  return PlaceSearchResult(
    candidates: (json['candidates'] as List<dynamic>)
        .map((e) => Place.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$PlaceSearchResultToJson(PlaceSearchResult instance) =>
    <String, dynamic>{
      'candidates': instance.candidates.map((e) => e.toJson()).toList(),
      'status': instance.status,
    };

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return Place(
    formattedAddress: json['formatted_address'] as String,
    geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'formatted_address': instance.formattedAddress,
      'geometry': instance.geometry.toJson(),
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return Geometry(
    location: Location.fromJson(json['location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'location': instance.location.toJson(),
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    lat: (json['lat'] as num).toDouble(),
    lng: (json['lng'] as num).toDouble(),
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
