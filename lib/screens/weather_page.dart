import 'package:flutter/material.dart';
import '../services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherService weatherService = WeatherService();

  double? temperature;
  String cityName = 'Toronto';
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data = await weatherService.getWeather(cityName);

      setState(() {
        temperature = data['main']['temp'];
        cityName = data['name'];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Could not load weather data.';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (isLoading) {
      content = const CircularProgressIndicator();
    } else if (errorMessage != null) {
      content = Text(
        errorMessage!,
        style: const TextStyle(fontSize: 18, color: Colors.red),
      );
    } else {
      content = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            cityName,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            '${temperature?.round()}°C',
            style: const TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: fetchWeather,
            child: const Text('Refresh'),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: Center(child: content),
    );
  }
}