import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://api.exchangerate-api.com/v4/latest/USD';

  static Future<Map<String, dynamic>?> fetchExchangeRates() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('API Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Fetch Error: $e');
    }
    return null;
  }
}
