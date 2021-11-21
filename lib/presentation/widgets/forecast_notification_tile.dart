import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forecast/data/models/notification_model.dart'
    as notificationModel;
import 'package:forecast/util/util.dart';
import 'package:intl/intl.dart';

class ForecastNotificationTile extends StatelessWidget {
  final notificationModel.Notification notification;
  ForecastNotificationTile({required this.notification});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: CachedNetworkImage(
              imageUrl: notification.forecast.weather[0].imageUrl,
              placeholder: (context, url) => Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            width: 9,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getTimeDifference(notification.forecast.date),
                  style: TextStyle(fontSize: 10, color: Color(0xff737272)),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Looks like ${notification.forecast.weather[0].description} in your location",
                  style: TextStyle(fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
