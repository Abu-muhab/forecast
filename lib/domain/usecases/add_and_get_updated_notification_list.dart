import 'package:forecast/data/models/notification_model.dart';
import 'package:forecast/domain/repositories/notification_repository.dart';
import 'package:forecast/domain/usecases/usecase.dart';

class AddAndGetUpdatedNotificationList
    implements
        UseCase<List<Notification>, AddAndGetUpdatedNotificationListParams> {
  final NotificationRepository repository;
  AddAndGetUpdatedNotificationList(this.repository);

  @override
  Future<List<Notification>> call(
      {required AddAndGetUpdatedNotificationListParams params}) async {
    await repository.saveNotification(params.notification);
    return repository.getNotifications();
  }
}

class AddAndGetUpdatedNotificationListParams {
  Notification notification;
  AddAndGetUpdatedNotificationListParams({required this.notification});
}
