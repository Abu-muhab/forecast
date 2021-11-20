import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forecast/constants.dart';
import 'package:forecast/data/models/forecast_model.dart';
import 'package:forecast/data/models/location_model.dart';

class CurrentForecastCard extends StatelessWidget {
  final Forecast forecast;
  final Location location;

  CurrentForecastCard({required this.forecast, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryTransparentColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.5, color: Color(0xffB9BCF2))),
      width: double.infinity,
      height: 350,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: CachedNetworkImage(
                    imageUrl: forecast.weather.first.imageUrl,
                    fit: BoxFit.fitWidth,
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
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 189,
                  child: FittedBox(
                    child: Text(
                      "${forecast.tempC.toInt()}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    "°C",
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                )
              ],
            ),
            Text(
              "${location.formattedLocation} ${forecast.formattedTime}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
