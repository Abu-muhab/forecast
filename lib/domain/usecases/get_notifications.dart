import 'package:forecast/data/models/notification_model.dart';
import 'package:forecast/domain/repositories/notification_repository.dart';
import 'package:forecast/domain/usecases/usecase.dart';

class GetNotifications implements UseCase<List<Notification>, NoParams> {
  final NotificationRepository repository;
  GetNotifications(this.repository);

  @override
  Future<List<Notification>> call({required NoParams params}) {
    return repository.getNotifications();
  }
}
