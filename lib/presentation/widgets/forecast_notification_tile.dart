import 'package:flutter/material.dart';

class ForecastNotificationTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Image.asset("images/fullsun.png"),
        ),
        SizedBox(
          width: 9,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "10 minutes ago",
              style: TextStyle(fontSize: 10, color: Color(0xff737272)),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "its a sunny day in your location",
              style: TextStyle(fontSize: 14),
            )
          ],
        )
      ],
    );
  }
}
