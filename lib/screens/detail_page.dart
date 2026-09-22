import 'package:flutter/material.dart';

import '../models/weather.dart';

class DetailPage extends StatelessWidget {
  final Weather weather;

  const DetailPage({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weather data received from WeatherPage
            Text(
              weather.cityName,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              'Temperature: ${weather.temperature.round()}°C',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 16),

            Text(
              'Feels Like: ${weather.feelsLike.round()}°C',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 16),

            Text(
              'Humidity: ${weather.humidity}%',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 16),

            Text(
              'Wind Speed: ${weather.windSpeed.toStringAsFixed(1)} m/s',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 16),

            Text(
              'Description: ${weather.weatherDescription}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}