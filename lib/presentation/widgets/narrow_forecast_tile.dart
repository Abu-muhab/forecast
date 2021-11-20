import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forecast/data/models/forecast_model.dart';

class NarrowForecastTile extends StatelessWidget {
  final Forecast forecast;
  NarrowForecastTile({required this.forecast});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 20,
              child: FittedBox(
                child: Text(
                  "${forecast.tempC.toInt()}",
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
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 40,
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
        SizedBox(
          height: 5,
        ),
        Text(
          "${forecast.formattedTime}",
          style: TextStyle(color: Colors.black, fontSize: 10),
        )
      ],
    );
  }
}
