import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forecast/constants.dart';
import 'package:forecast/presentation/widgets/forecast_notification_tile.dart';

class ForecastNotification extends StatelessWidget {
  final Function()? onDismiss;

  ForecastNotification({@required this.onDismiss});

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
                height: constraint.maxHeight * 0.6,
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
                                "Your notifications",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Earlier",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff737272),
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ForecastNotificationTile(),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(),
                            SizedBox(
                              height: 5,
                            ),
                            ForecastNotificationTile(),
                            SizedBox(
                              height: 5,
                            ),
                            Divider()
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
