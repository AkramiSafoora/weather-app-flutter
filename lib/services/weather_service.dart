import 'package:http/http.dart' as http;

class WeatherService {
  Future<void> getWeather() async {
    final url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=43.6532&longitude=-79.3832&current=temperature_2m,relative_humidity_2m,wind_speed_10m,apparent_temperature',
    );

    final response = await http.get(url);

    print(response.body);
  }
}