import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forecast/data/models/day_summary_forecast_model.dart';

class WideForecastTile extends StatelessWidget {
  final DaySummaryForecast forecast;
  WideForecastTile({required this.forecast});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "${forecast.formattedDate}",
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        SizedBox(
          height: 27*1.2,
          width: 48*1.2,
          child: CachedNetworkImage(
            imageUrl: forecast.weather[0].imageUrl,
            placeholder: (context, _) {
              return Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 20,
              child: FittedBox(
                child: Text(
                  "${forecast.tempC.floor().toInt()}",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2),
              child: Text(
                "°C",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            )
          ],
        ),
      ],
    );
  }
}
