import 'package:forecast/data/models/place_search_result_model.dart';
import 'package:forecast/data/network/places_rest_client.dart';
import 'package:forecast/domain/usecases/usecase.dart';

class FindLocationFromText
    implements UseCase<PlaceSearchResult, FindLocationFromTextParams> {
  final PlacesRestClient placesRestClient;
  FindLocationFromText({required this.placesRestClient});
  @override
  Future<PlaceSearchResult> call({required FindLocationFromTextParams params}) {
    return placesRestClient.findPlacesFromText(
        params.query,
        "textquery",
        "formatted_address,name,place_id,geometry",
        "AIzaSyB_rPr66VTngzCveTyuIed5C_Rs3CAApfE");
  }
}

class FindLocationFromTextParams {
  String query;
  FindLocationFromTextParams({required this.query});
}
