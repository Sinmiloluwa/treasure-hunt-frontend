import 'package:treasure_hunt/services/api_service.dart';
import 'dart:convert';

class HuntService {
  Future getHunts() async {
    final response = await ApiService.get('/hunts');
    if (response.statusCode == 200) {
      final huntData = json.decode(response.body);
      final hunts = huntData['data'];
      print('Hunts data: $hunts');
      return hunts;
    } else {
      throw Exception('Failed to fetch hunts: \\n${response.body}');
    }
  }
}