import 'package:flutter/material.dart';
import 'package:forecast/presentation/pages/forecast/forecast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forecast',
      home: ForecastScreen(),
    );
  }
}
