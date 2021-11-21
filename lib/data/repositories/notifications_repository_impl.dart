import 'dart:convert';
import 'package:forecast/data/models/notification_model.dart';
import 'package:forecast/domain/repositories/notification_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final SharedPreferences sharedPreferences;
  NotificationRepositoryImpl({required this.sharedPreferences});
  @override
  Future<List<Notification>> getNotifications() async {
    List<Notification> notifications = await fetchNotificationFromPrefs();
    return notifications.reversed.toList();
  }

  @override
  Future<void> setNotificationsAsRead() async {
    List<Notification> notifications = await fetchNotificationFromPrefs();
    notifications.forEach((notification) {
      notification.read = true;
    });
    await sharedPreferences.setString(
        "notifications", json.encode(notifications));
  }

  @override
  Future<bool> saveNotification(Notification notification) async {
    List<Notification> notifications = await fetchNotificationFromPrefs();
    notifications.add(notification);
    return sharedPreferences.setString(
        "notifications", json.encode(notifications));
  }

  Future<List<Notification>> fetchNotificationFromPrefs() async {
    String? notificationsJsonString =
        sharedPreferences.getString("notifications");
    List<Notification> notifications = [];
    if (notificationsJsonString != null) {
      List notsJsons = json.decode(notificationsJsonString);
      notsJsons.forEach((element) {
        notifications.add(Notification.fromJson(element));
      });
    }
    return notifications;
  }
}
