import 'package:flutter/material.dart';

class NarrowForecastTile extends StatelessWidget {
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
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 25,
          width: 25,
          child: Image.asset("images/fullsun.png"),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "8 am",
          style: TextStyle(color: Colors.black, fontSize: 10),
        )
      ],
    );
  }
}
