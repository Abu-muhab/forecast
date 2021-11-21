// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
    forecast: Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
    read: json['read'] as bool,
  );
}

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'forecast': instance.forecast.toJson(),
      'read': instance.read,
    };
