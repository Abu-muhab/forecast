import 'package:dio/dio.dart';
import 'package:forecast/data/models/place_search_result_model.dart';
import 'package:retrofit/http.dart';

part 'places_rest_client.g.dart';

@RestApi(baseUrl: "https://maps.googleapis.com/maps/api/place")
abstract class PlacesRestClient {
  factory PlacesRestClient(Dio dio, {String baseUrl}) = _PlacesRestClient;

  @GET("/findplacefromtext/json")
  Future<PlaceSearchResult> findPlacesFromText(
      @Query("input") String query,
      @Query("inputtype") String inputtype,
      @Query("fields") String field,
      @Query("key") String key);
}
