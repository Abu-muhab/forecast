import 'package:flutter/material.dart';
import 'package:forecast/constants.dart';

class ForecastLoadingBox extends StatelessWidget {
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
        child: SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
