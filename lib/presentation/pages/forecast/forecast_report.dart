import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forecast/constants.dart';
import 'package:forecast/presentation/widgets/narrow_forecast_tile.dart';
import 'package:forecast/presentation/widgets/wide_forecast_tile.dart';

class ForecastReport extends StatelessWidget {
  final Function()? onDismiss;

  ForecastReport({@required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        height: constraint.maxHeight,
        width: constraint.maxWidth,
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                onDismiss?.call();
              },
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: kPrimaryTransparentColor,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: constraint.maxHeight * 0.8,
                width: constraint.maxWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: EdgeInsets.all(26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 3,
                        width: 100,
                        color: Color(0xff9D9D9D),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      InkWell(
                        onTap: () {
                          onDismiss?.call();
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(112, 71, 235, 0.1),
                              borderRadius: BorderRadius.circular(20)),
                          height: 43,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Forecast report",
                                style: TextStyle(color: kPrimaryColor),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: kPrimaryColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 39,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Today",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: double.infinity,
                              height: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  border: Border.all(
                                      color: Color(0xffD5C7FF), width: 0.5)),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    NarrowForecastTile(),
                                    NarrowForecastTile(),
                                    NarrowForecastTile(),
                                    NarrowForecastTile(),
                                    NarrowForecastTile(),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Next forecast",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 100,
                                  height: 36,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: Text(
                                      "Five Days",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  border: Border.all(
                                      color: Color(0xffD5C7FF), width: 0.5)),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    WideForecastTile(),
                                    Divider(),
                                    WideForecastTile(),
                                    Divider(),
                                    WideForecastTile(),
                                    Divider(),
                                    WideForecastTile(),
                                    Divider(),
                                    WideForecastTile(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
