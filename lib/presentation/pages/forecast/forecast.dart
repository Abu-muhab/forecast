import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forecast/constants.dart';
import 'package:forecast/data/models/aggregate_forecast_model.dart';
import 'package:forecast/presentation/pages/forecast/current_forecast_card.dart';
import 'package:forecast/presentation/pages/forecast/forecast_notification.dart';
import 'package:forecast/presentation/pages/forecast/forecast_report.dart';
import 'package:forecast/presentation/providers/forecast_model.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ForecastScreen extends StatefulWidget {
  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  bool showReport = false;
  bool showNotifications = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: kPrimaryColor,
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 24, right: 25, top: 30, bottom: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Selector<ForecastModel, Tuple2>(
                            selector: (context, model) => Tuple2(
                                model.isLoading, model.aggregateForecast),
                            builder: (context, tuple2, _) {
                              return Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                decoration: BoxDecoration(
                                    color: kPrimaryTransparentColor,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 43,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      tuple2.item1 == true ||
                                              tuple2.item2 == null
                                          ? ""
                                          : "${(tuple2.item2 as AggregateForecast).location!.formattedLocation}",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              );
                            }),
                        InkWell(
                          onTap: () {
                            setState(() {
                              showNotifications = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: kPrimaryTransparentColor,
                                borderRadius: BorderRadius.circular(10)),
                            width: 44,
                            height: 44,
                            child: Center(
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                        child: Center(
                      child: Selector<ForecastModel, Tuple2>(
                        selector: (context, model) =>
                            Tuple2(model.isLoading, model.currentForecast),
                        builder: (context, tuple2, _) {
                          if (tuple2.item1 == true && tuple2.item2 == null) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: kPrimaryTransparentColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1.5, color: Color(0xffB9BCF2))),
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

                          if (tuple2.item1 == false && tuple2.item2 == null) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: kPrimaryTransparentColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1.5, color: Color(0xffB9BCF2))),
                              width: double.infinity,
                              height: 350,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    "Failed to fetch forecast",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Provider.of<ForecastModel>(context,
                                              listen: false)
                                          .loadForecasts();
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.1),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Retry",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.refresh,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }

                          return CurrentForecastCard(
                            location: Provider.of<ForecastModel>(context,
                                    listen: false)
                                .aggregateForecast!
                                .location!,
                            forecast: tuple2.item2,
                          );
                        },
                      ),
                    )),
                    InkWell(
                      onTap: () {
                        setState(() {
                          showReport = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.1),
                            borderRadius: BorderRadius.circular(8)),
                        width: double.infinity,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Forecast report",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.keyboard_arrow_up_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              AnimatedPositioned(
                  top: showReport == false
                      ? MediaQuery.of(context).size.height * 1.5
                      : 0,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ForecastReport(
                      onDismiss: () {
                        setState(() {
                          showReport = false;
                        });
                      },
                    ),
                  ),
                  duration: Duration(milliseconds: 200)),
              AnimatedPositioned(
                  top: showNotifications == false
                      ? MediaQuery.of(context).size.height * 1.5
                      : 0,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ForecastNotification(
                      onDismiss: () {
                        setState(() {
                          showNotifications = false;
                        });
                      },
                    ),
                  ),
                  duration: Duration(milliseconds: 200))
            ],
          ),
        ),
      ),
    );
  }
}
