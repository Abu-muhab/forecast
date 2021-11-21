import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forecast/constants.dart';
import 'package:forecast/data/models/forecast_model.dart';
import 'package:forecast/data/models/location_model.dart';
import 'package:forecast/presentation/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class CurrentForecastCard extends StatelessWidget {
  final Forecast forecast;
  final Location? location;

  CurrentForecastCard({required this.forecast, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryTransparentColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.5, color: Color(0xffB9BCF2))),
      width: double.infinity,
      height: 375,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Selector<SettingsProvider, bool>(
                  selector: (context, model) => model.useCelcius,
                  builder: (context, useCelcius, _) {
                    return Switch(
                        value: useCelcius,
                        onChanged: (value) {
                          Provider.of<SettingsProvider>(context, listen: false)
                              .setTempModeToCelcius(value);
                        });
                  },
                ),
                Text(
                  "C",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: CachedNetworkImage(
                    imageUrl: forecast.weather.first.imageUrl,
                    fit: BoxFit.fitWidth,
                    placeholder: (context, _) {
                      return Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      forecast.formattedDate,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
            Selector<SettingsProvider, bool>(
              selector: (context, model) => model.useCelcius,
              builder: (context, useCelcius, _) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: 189,
                      child: FittedBox(
                        child: Text(
                          "${useCelcius == false ? forecast.tempF.toInt() : forecast.tempC.toInt()}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        useCelcius ? "°C" : "°F",
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    )
                  ],
                );
              },
            ),
            Text(
              "${location == null ? "" : location!.formattedLocation} ${forecast.formattedTime}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
