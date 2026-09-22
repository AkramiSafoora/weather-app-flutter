import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Added for navigation using GoRouter
import 'package:go_router/go_router.dart';

import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController cityController =
      TextEditingController(text: 'Toronto');

  @override
  void initState() {
    super.initState();

    context.read<WeatherBloc>().add(
          SearchWeather('Toronto'),
        );
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  IconData getWeatherIcon(String weatherMain) {
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

  void searchWeather() {
    final city = cityController.text.trim();

    if (city.isNotEmpty) {
      context.read<WeatherBloc>().add(
            SearchWeather(city),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  onPressed: searchWeather,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onSubmitted: (_) => searchWeather(),
            ),
          ),

          Expanded(
            child: Center(
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const CircularProgressIndicator();
                  }

                  if (state is WeatherError) {
                    return Text(
                      state.message,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    );
                  }

                  if (state is WeatherLoaded) {
                    final weather = state.weather;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          getWeatherIcon(weather.weatherMain),
                          size: 90,
                        ),

                        const SizedBox(height: 20),

                        Text(
                          weather.cityName,
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          '${weather.temperature.round()}°C',
                          style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          formatDescription(
                            weather.weatherDescription,
                          ),
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),

                        const SizedBox(height: 30),

                        Text(
                          'Feels Like: ${weather.feelsLike.round()}°C',
                        ),

                        Text(
                          'Humidity: ${weather.humidity}%',
                        ),

                        Text(
                          'Wind: ${weather.windSpeed.toStringAsFixed(1)} m/s',
                        ),

                        const SizedBox(height: 24),

                        ElevatedButton(
                          onPressed: searchWeather,
                          child: const Text('Refresh'),
                        ),

                        const SizedBox(height: 12),

                        // Added: Navigate from WeatherPage to DetailPage
                        // using GoRouter
                        ElevatedButton(
                          onPressed: () {
                            context.push('/details',
                                extra: weather,);
                          },
                          child: const Text('View Details'),
                        ),
                      ],
                    );
                  }

                  return const Text('Search for a city');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}