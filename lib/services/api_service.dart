import 'package:treasure_hunt/services/session_service.dart';

class ApiService {
  // Define your API service methods and properties here
  final String baseUrl;
  ApiService(this.baseUrl);

  static Future<Map<String, String>> _getHeaders(
      {bool includeAuth = true}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (includeAuth) {
      final token = await SessionService.getToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

}