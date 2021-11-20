import 'package:flutter/material.dart';
import 'package:forecast/data/models/aggregate_forecast_model.dart';
import 'package:forecast/data/models/day_summary_forecast_model.dart';
import 'package:forecast/data/models/forecast_model.dart';
import 'package:forecast/domain/usecases/get_aggregate_forecast.dart';

class ForecastModel extends ChangeNotifier {
  final GetAggregateForecast getAggregateForecast;

  ForecastModel({required this.getAggregateForecast});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  AggregateForecast? _aggregateForecast;

  AggregateForecast? get aggregateForecast => _aggregateForecast;

  Forecast? get currentForecast {
    return _aggregateForecast?.current;
  }

  List<Forecast>? get fiveHoursForecast {
    if (_aggregateForecast != null) {
      List<Forecast> fiveHoursForecast = [];
      for (int x = 1; x <= 10; x += 2) {
        fiveHoursForecast.add(_aggregateForecast!.hourly![x]);
      }
      return fiveHoursForecast;
    }
  }

  List<DaySummaryForecast>? get fiveDaysForecast {
    if (_aggregateForecast != null) {
      List<DaySummaryForecast> fiveDaysForecast = [];
      for (int x = 0; x < 5; x++) {
        fiveDaysForecast.add(_aggregateForecast!.daily![x]);
      }
      return fiveDaysForecast;
    }
  }

  Future<void> loadForecasts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _aggregateForecast = await getAggregateForecast.call(
          params: Params(lat: 9.0765, lon: 7.3986));
      print(_aggregateForecast!.current!.toJson());
      _isLoading = false;
      notifyListeners();
    } catch (err) {
      print(err);
      _isLoading = false;
      notifyListeners();
    }
  }
}
