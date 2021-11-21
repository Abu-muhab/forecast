import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forecast/constants.dart';
import 'package:forecast/data/models/notification_model.dart'
    as notificationModel;
import 'package:forecast/presentation/providers/notification_provider.dart';
import 'package:forecast/presentation/widgets/forecast_notification_tile.dart';
import 'package:provider/provider.dart';

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
                        height: 15,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Selector<NotificationProvider,
                                    List<notificationModel.Notification>>(
                                builder: (context, notifications, _) {
                                  if (notifications.isEmpty) {
                                    return Center(
                                      child: Text("No notifications"),
                                    );
                                  }
                                  return SizedBox(
                                    height: constraint.maxHeight,
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount: notifications.length,
                                      itemBuilder: (context, count) {
                                        return Column(
                                          children: [
                                            ForecastNotificationTile(
                                              notification:
                                                  notifications[count],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Divider(),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                },
                                selector: (context, model) =>
                                    model.notifications),
                          )
                        ],
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
