import 'package:flutter/material.dart';
import '../services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherService weatherService = WeatherService();

  final TextEditingController cityController =
      TextEditingController(text: 'Toronto');

  double? temperature;
  double? feelsLike;
  int? humidity;
  double? windSpeed;
  String cityName = 'Toronto';
  String? weatherMain;
  String? weatherDescription;

  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  Future<void> fetchWeather() async {
    final city = cityController.text.trim();

    if (city.isEmpty) {
      setState(() {
        errorMessage = 'Please enter a city name.';
        isLoading = false;
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data = await weatherService.getWeather(city);

      setState(() {
        temperature = data['main']['temp'];
        feelsLike = data['main']['feels_like'];
        humidity = data['main']['humidity'];
        windSpeed = data['wind']['speed'];
        cityName = data['name'];
        weatherMain = data['weather'][0]['main'];
        weatherDescription = data['weather'][0]['description'];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Could not load weather data.';
        isLoading = false;
      });
    }
  }

  IconData getWeatherIcon() {
    switch (weatherMain) {
      case 'Clear':
        return Icons.wb_sunny;
      case 'Clouds':
        return Icons.cloud;
      case 'Rain':
        return Icons.water_drop;
      case 'Snow':
        return Icons.ac_unit;
      case 'Thunderstorm':
        return Icons.thunderstorm;
      default:
        return Icons.wb_cloudy;
    }
  }

  String formatDescription(String description) {
    if (description.isEmpty) return '';

    return description
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1);
        })
        .join(' ');
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
          Icon(
            getWeatherIcon(),
            size: 90,
          ),
          const SizedBox(height: 20),
          Text(
            cityName,
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            '${temperature?.round()}°C',
            style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            formatDescription(weatherDescription ?? ''),
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 30),
          Text('Feels Like: ${feelsLike?.round()}°C'),
          Text('Humidity: $humidity%'),
          Text('Wind: ${windSpeed?.toStringAsFixed(1)} m/s'),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: cityController,
              decoration: InputDecoration(
                hintText: 'Enter city',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: fetchWeather,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onSubmitted: (_) => fetchWeather(),
            ),
          ),
          Expanded(
            child: Center(child: content),
          ),
        ],
      ),
    );
  }
}