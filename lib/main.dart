import 'package:flutter/material.dart';
import 'package:forecast/injection_container.dart';
import 'package:forecast/presentation/pages/forecast/forecast.dart';

void main() async {
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forecast',
      home: ForecastScreen(),
    );
  }
}
