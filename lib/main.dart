import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forecast/injection_container.dart';
import 'package:forecast/presentation/pages/forecast/forecast.dart';
import 'package:forecast/presentation/pages/search/search.dart';
import 'package:forecast/presentation/providers/forecast_provider.dart';
import 'package:forecast/presentation/providers/location_provider.dart';
import 'package:forecast/presentation/providers/settings_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => sl<ForecastProvider>()..loadForecasts()),
          ChangeNotifierProvider(
              create: (context) => sl<LocationProvider>()..checkPermission()),
          ChangeNotifierProvider(create: (context) => sl<SettingsProvider>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Forecast',
          routes: {
            "/": (context) => ForecastScreen(),
            "/search": (context) => SearchScreen()
          },
          initialRoute: "/",
        ));
  }
}
