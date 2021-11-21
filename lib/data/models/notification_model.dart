import 'package:forecast/data/models/forecast_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notification_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Notification {
  Forecast forecast;
  bool read;

  Notification({required this.forecast, required this.read});

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
