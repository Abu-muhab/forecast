import 'package:flutter/material.dart';
import 'package:forecast/data/models/aggregate_forecast_model.dart';
import 'package:forecast/data/models/forecast_model.dart';
import 'package:forecast/domain/usecases/get_aggregate_forecast.dart';

class ForecastModel extends ChangeNotifier {
  final GetAggregateForecast? getAggregateForecast;

  ForecastModel({@required this.getAggregateForecast});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  AggregateForecast? _aggregateForecast;

  AggregateForecast? get aggregateForecast => _aggregateForecast;

  Forecast? get currentForecast {
    return _aggregateForecast?.current;
  }

  Future<void> loadForecasts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _aggregateForecast = await getAggregateForecast!
          .call(params: Params(lat: 9.0765, lon: 7.3986));
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
