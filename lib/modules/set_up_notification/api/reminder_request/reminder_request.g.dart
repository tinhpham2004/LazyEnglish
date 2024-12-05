// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReminderRequest _$ReminderRequestFromJson(Map<String, dynamic> json) =>
    ReminderRequest(
      userId: json['userId'] as String?,
      deviceToken: json['deviceToken'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      frequency: json['frequency'] as String?,
    );

Map<String, dynamic> _$ReminderRequestToJson(ReminderRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'deviceToken': instance.deviceToken,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'frequency': instance.frequency,
    };
