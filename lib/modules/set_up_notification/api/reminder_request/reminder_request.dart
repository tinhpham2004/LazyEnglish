import 'package:json_annotation/json_annotation.dart';

part 'reminder_request.g.dart';

@JsonSerializable()
class ReminderRequest {
  String? userId;
  String? deviceToken;
  String? startDate;
  String? endDate;
  String? frequency;

  ReminderRequest({
    this.userId,
    this.deviceToken,
    this.startDate,
    this.endDate,
    this.frequency,
  });

  factory ReminderRequest.fromJson(Map<String, dynamic> json) {
    return _$ReminderRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReminderRequestToJson(this);
}
