import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String apiKey =
      String.fromEnvironment('OPENWEATHER_API_KEY');

  Future<Map<String, dynamic>> getWeather(String city) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.body);
    }
  }
}