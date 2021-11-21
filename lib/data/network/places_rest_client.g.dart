// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PlacesRestClient implements PlacesRestClient {
  _PlacesRestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://maps.googleapis.com/maps/api/place';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PlaceSearchResult> findPlacesFromText(
      query, inputtype, field, key) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'input': query,
      r'inputtype': inputtype,
      r'fields': field,
      r'key': key
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PlaceSearchResult>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/findplacefromtext/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PlaceSearchResult.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
