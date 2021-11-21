import 'package:flutter/material.dart';
import 'package:forecast/constants.dart';
import 'package:forecast/data/models/aggregate_forecast_model.dart';
import 'package:forecast/data/models/place_search_result_model.dart';
import 'package:forecast/presentation/providers/forecast_provider.dart';
import 'package:forecast/presentation/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ForecastNavigation extends StatelessWidget {
  final Place? place;
  final Function onSearchButtonClicked;
  final Function onNotificationButtonClicked;
  ForecastNavigation(
      {this.place,
      required this.onNotificationButtonClicked,
      required this.onSearchButtonClicked});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Selector<ForecastProvider, Tuple2>(
            selector: (context, model) =>
                Tuple2(model.isLoading, model.aggregateForecast),
            builder: (context, tuple2, _) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  place == null
                      ? Container()
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(
                        color: kPrimaryTransparentColor,
                        borderRadius: BorderRadius.circular(20)),
                    height: 43,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
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
                          tuple2.item1 == true || tuple2.item2 == null
                              ? ""
                              : place != null
                                  ? "${place!.formattedAddress}"
                                  : "${(tuple2.item2 as AggregateForecast).location!.formattedLocation}",
                          style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ))
                      ],
                    ),
                  )
                ],
              );
            }),
        place != null
            ? Container()
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomIconButton(
                    onTap: () {
                      onSearchButtonClicked();
                    },
                    iconData: Icons.search,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomIconButton(
                    onTap: () {
                      onNotificationButtonClicked();
                    },
                    iconData: Icons.notifications,
                  )
                ],
              )
      ],
    );
  }
}
