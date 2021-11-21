import 'package:flutter/material.dart';
import 'package:forecast/data/models/forecast_model.dart';
import 'package:forecast/data/models/notification_model.dart'
    as notificationModel;
import 'package:forecast/domain/usecases/add_and_get_updated_notification_list.dart';
import 'package:forecast/domain/usecases/get_notifications.dart';
import 'package:forecast/domain/usecases/marks_notifications_as_read_and_get_updated_list.dart';
import 'package:forecast/domain/usecases/usecase.dart';
import 'package:forecast/presentation/providers/forecast_provider.dart';

class NotificationProvider extends ChangeNotifier {
  final AddAndGetUpdatedNotificationList addAndGetUpdatedNotificationList;
  final GetNotifications getNotifications;
  final MarkNotificationsAsReadAndGetUpdatedList
      markNotificationsAsReadAndGetUpdatedList;
  NotificationProvider(
      {required this.addAndGetUpdatedNotificationList,
      required this.getNotifications,
      required this.markNotificationsAsReadAndGetUpdatedList});
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<notificationModel.Notification> _notifications = [];
  List<notificationModel.Notification> get notifications => _notifications;

  ForecastProvider? _forecastProvider;
  Forecast? latestForecast;

  bool get unreadNotificationsExist =>
      _notifications.any((notification) => !notification.read);

  Future<void> loadNotifications() async {
    _isLoading = true;
    notifyListeners();
    _notifications = await getNotifications.call(params: NoParams());
    _isLoading = false;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> addNotification(
      notificationModel.Notification notification) async {
    _notifications = await addAndGetUpdatedNotificationList.call(
        params:
            AddAndGetUpdatedNotificationListParams(notification: notification));
    notifyListeners();
  }

  Future<void> markNotificationsAsRead() async {
    _notifications =
        await markNotificationsAsReadAndGetUpdatedList.call(params: NoParams());
    notifyListeners();
  }

  setForecastProvider(ForecastProvider forecastProvider) {
    _forecastProvider = forecastProvider;
    _forecastProvider!.addListener(() async {
      if (_forecastProvider!.searchMode == true) {
        return;
      }
      await loadNotifications();
      if (_forecastProvider != null &&
          _forecastProvider!.currentForecast != null) {
        if (latestForecast != _forecastProvider!.currentForecast) {
          addNotification(notificationModel.Notification(
              forecast: forecastProvider.currentForecast!, read: false));
          latestForecast = _forecastProvider!.currentForecast;
        }
      }
    });
    notifyListeners();
  }
}
