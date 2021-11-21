import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forecast/constants.dart';
import 'package:forecast/data/models/aggregate_forecast_model.dart';
import 'package:forecast/data/models/place_search_result_model.dart';
import 'package:forecast/domain/usecases/get_aggregate_forecast.dart';
import 'package:forecast/presentation/pages/forecast/current_forecast_card.dart';
import 'package:forecast/presentation/pages/forecast/forecast_action_box.dart';
import 'package:forecast/presentation/pages/forecast/forecast_loading_box.dart';
import 'package:forecast/presentation/pages/forecast/forecast_notification.dart';
import 'package:forecast/presentation/pages/forecast/forecast_report.dart';
import 'package:forecast/presentation/providers/forecast_provider.dart';
import 'package:forecast/presentation/providers/location_provider.dart';
import 'package:forecast/presentation/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ForecastScreen extends StatefulWidget {
  final Place? place;
  ForecastScreen({this.place});
  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  bool showReport = false;
  bool showNotifications = false;

  @override
  void initState() {
    super.initState();
    if (widget.place != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Provider.of<ForecastProvider>(context, listen: false)
            .setSearchMode(true);
        Provider.of<ForecastProvider>(context, listen: false).loadForecasts(
            params: GetAggregateForecastParams(
                lat: widget.place!.geometry.location.lat,
                lon: widget.place!.geometry.location.lng));
      });
    }
  }

  Future<void> loadOrRefreshForecast() async {
    if (widget.place != null) {
      await Provider.of<ForecastProvider>(context, listen: false).loadForecasts(
          params: GetAggregateForecastParams(
              lat: widget.place!.geometry.location.lat,
              lon: widget.place!.geometry.location.lng));
    } else {
      await Provider.of<ForecastProvider>(context, listen: false)
          .loadForecasts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: kPrimaryColor,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Stack(
                children: [
                  RefreshIndicator(
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 24, right: 25, top: 30, bottom: 30),
                          child: SizedBox(
                            height: constraint.maxHeight - 60,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Selector<ForecastProvider,
                                                Tuple2>(
                                            selector: (context, model) =>
                                                Tuple2(model.isLoading,
                                                    model.aggregateForecast),
                                            builder: (context, tuple2, _) {
                                              return Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  widget.place == null
                                                      ? Container()
                                                      : Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Icon(
                                                                  Icons
                                                                      .arrow_back_ios,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            )
                                                          ],
                                                        ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    padding: EdgeInsets.only(
                                                        left: 12, right: 12),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            kPrimaryTransparentColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    height: 43,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                          color: Colors.white,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                            child: Text(
                                                          tuple2.item1 ==
                                                                      true ||
                                                                  tuple2.item2 ==
                                                                      null
                                                              ? ""
                                                              : widget.place !=
                                                                      null
                                                                  ? "${widget.place!.formattedAddress}"
                                                                  : "${(tuple2.item2 as AggregateForecast).location!.formattedLocation}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ))
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              );
                                            })),
                                    widget.place != null
                                        ? Container()
                                        : Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomIconButton(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, "/search");
                                                },
                                                iconData: Icons.search,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              CustomIconButton(
                                                onTap: () {
                                                  setState(() {
                                                    showNotifications = true;
                                                  });
                                                },
                                                iconData: Icons.notifications,
                                              )
                                            ],
                                          )
                                  ],
                                ),
                                Expanded(
                                    child: Center(
                                  child: Selector<LocationProvider, Tuple2>(
                                    selector: (context, model) => Tuple2(
                                        model.isPermissionGranted,
                                        model.isCheckingPermission),
                                    builder: (context, tuple2, _) {
                                      if (tuple2.item2 == true) {
                                        return ForecastLoadingBox();
                                      }

                                      if (tuple2.item1 == false) {
                                        return ForecastActionBox(
                                            onActionButtonPressed: () {
                                              Provider.of<LocationProvider>(
                                                      context,
                                                      listen: false)
                                                  .requestPermission();
                                            },
                                            promptText:
                                                "Grant location permission",
                                            actionButtonIcon: Icons.location_on,
                                            actionButtonText: "Grant");
                                      }

                                      return Selector<ForecastProvider, Tuple2>(
                                        selector: (context, model) => Tuple2(
                                            model.isLoading,
                                            model.currentForecast),
                                        builder: (context, tuple2, _) {
                                          if (tuple2.item1 == true &&
                                              tuple2.item2 == null) {
                                            return ForecastLoadingBox();
                                          }

                                          if (tuple2.item1 == false &&
                                              tuple2.item2 == null) {
                                            return ForecastActionBox(
                                                onActionButtonPressed: () {
                                                  loadOrRefreshForecast();
                                                },
                                                promptText:
                                                    "Failed to fetch forecast",
                                                actionButtonIcon: Icons.refresh,
                                                actionButtonText: "Retry");
                                          }

                                          return CurrentForecastCard(
                                            location:
                                                Provider.of<ForecastProvider>(
                                                        context,
                                                        listen: false)
                                                    .aggregateForecast!
                                                    .location,
                                            forecast: tuple2.item2,
                                          );
                                        },
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
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.1),
                                        borderRadius: BorderRadius.circular(8)),
                                    width: double.infinity,
                                    height: 60,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                        ),
                      ),
                      onRefresh: () async {
                        await loadOrRefreshForecast();
                      }),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
