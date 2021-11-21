import 'package:forecast/data/models/notification_model.dart';

abstract class NotificationRepository {
  Future<List<Notification>> getNotifications();
  Future<void> setNotificationsAsRead();
  Future<bool> saveNotification(Notification notification);
}
