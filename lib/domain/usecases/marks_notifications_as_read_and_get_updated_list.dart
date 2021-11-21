import 'package:forecast/data/models/notification_model.dart';
import 'package:forecast/domain/repositories/notification_repository.dart';
import 'package:forecast/domain/usecases/usecase.dart';

class MarkNotificationsAsReadAndGetUpdatedList
    implements UseCase<List<Notification>, NoParams> {
  final NotificationRepository notificationsRepository;

  MarkNotificationsAsReadAndGetUpdatedList(this.notificationsRepository);

  @override
  Future<List<Notification>> call({required NoParams params}) async {
    await notificationsRepository.setNotificationsAsRead();
    return notificationsRepository.getNotifications();
  }
}
