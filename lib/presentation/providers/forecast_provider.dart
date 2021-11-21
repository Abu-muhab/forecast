import 'package:flutter/material.dart';
import 'package:forecast/data/models/aggregate_forecast_model.dart';
import 'package:forecast/data/models/day_summary_forecast_model.dart';
import 'package:forecast/data/models/forecast_model.dart';
import 'package:forecast/domain/usecases/get_aggregate_forecast.dart';
import 'package:location/location.dart';

class ForecastProvider extends ChangeNotifier {
  final GetAggregateForecast getAggregateForecast;
  final Location location;

  ForecastProvider(
      {required this.getAggregateForecast, required this.location});

  bool _isLoading = false;

  bool _searchMode = false;
  bool get searchMode => _searchMode;

  bool get isLoading => _isLoading;

  AggregateForecast? _aggregateForecast;
  AggregateForecast? _searchAggregateForecast;

  AggregateForecast? get aggregateForecast {
    if (_searchMode == false) {
      return _aggregateForecast;
    }
    return _searchAggregateForecast;
  }

  Forecast? get currentForecast {
    return aggregateForecast?.current;
  }

  List<Forecast>? get fiveHoursForecast {
    if (aggregateForecast != null) {
      List<Forecast> fiveHoursForecast = [];
      for (int x = 1; x <= 10; x += 2) {
        fiveHoursForecast.add(aggregateForecast!.hourly![x]);
      }
      return fiveHoursForecast;
    }
  }

  List<DaySummaryForecast>? get fiveDaysForecast {
    if (aggregateForecast != null) {
      List<DaySummaryForecast> fiveDaysForecast = [];
      for (int x = 0; x < 5; x++) {
        fiveDaysForecast.add(aggregateForecast!.daily![x]);
      }
      return fiveDaysForecast;
    }
  }

  Future<void> loadForecasts({GetAggregateForecastParams? params}) async {
    _isLoading = true;
    notifyListeners();
    try {
      LocationData? locationData;
      if (params == null) {
        locationData = await location.getLocation();
      }
      AggregateForecast forecast = await getAggregateForecast.call(
          params: params != null
              ? params
              : GetAggregateForecastParams(
                  lat: locationData!.latitude!, lon: locationData.longitude!));
      _isLoading = false;
      if (_searchMode) {
        _searchAggregateForecast = forecast;
      } else {
        _aggregateForecast = forecast;
      }
      notifyListeners();
    } catch (err) {
      print(err);
      _isLoading = false;
      notifyListeners();
    }
  }

  void setSearchMode(bool value) {
    if (value == false) {
      _searchAggregateForecast = null;
    }
    _searchMode = value;
    notifyListeners();
  }
}
