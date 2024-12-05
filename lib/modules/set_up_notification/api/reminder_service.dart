import 'package:lazy_english/modules/set_up_notification/api/reminder_request/reminder_request.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReminderService {
  final String baseUrl = 'https://lazy.lokcet.xyz';
  final String endpoint = '/api/reminder';

  Future<bool> setReminder(ReminderRequest request) async {
    final url = Uri.parse('$baseUrl$endpoint');
    print(jsonEncode(request.toJson()));
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      return false;
    }

    return true;
  }
}
