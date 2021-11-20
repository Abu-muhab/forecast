import 'package:flutter/material.dart';
import 'package:forecast/injection_container.dart';
import 'package:forecast/presentation/pages/forecast/forecast.dart';
import 'package:forecast/presentation/providers/forecast_model.dart';
import 'package:provider/provider.dart';

void main() async {
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => sl<ForecastModel>()..loadForecasts())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Forecast',
          home: ForecastScreen(),
        ));
  }
}
