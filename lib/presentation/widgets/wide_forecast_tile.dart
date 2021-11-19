import 'package:flutter/material.dart';

class WideForecastTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "April 5",
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        SizedBox(
          height: 27,
          width: 48,
          child: Image.asset("images/halfsun.png"),
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
                  "28",
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
