import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forecast/constants.dart';
import 'package:forecast/domain/usecases/get_aggregate_forecast.dart';
import 'package:forecast/injection_container.dart';
import 'package:forecast/presentation/pages/forecast/forecast_notification.dart';
import 'package:forecast/presentation/pages/forecast/forecast_report.dart';

class ForecastScreen extends StatefulWidget {
  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  bool showReport = false;
  bool showNotifications = false;

  void test() async {
    sl<GetAggregateForecast>().call(params: Params(lat: 9.0765,lon: 7.3986)).then((value) => print(value.toJson()));
  }

  @override
  void initState() {
    test();
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
                        Container(
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
                                "Lagos, Nigeria",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
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
                      child: Container(
                        decoration: BoxDecoration(
                            color: kPrimaryTransparentColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1.5, color: Color(0xffB9BCF2))),
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
                                    child: Image.asset(
                                      "images/weather.png",
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Today",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Mon, 26 Apr",
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
                                        "28",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 40),
                                    child: Text(
                                      "°C",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 19),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "Lagos, Nigeria 2:00pm",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                    InkWell(
                      onTap: () {
                        print("showing report");
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
