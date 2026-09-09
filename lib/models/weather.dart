import '../models/weather.dart';

class Weather {
  final double temperature;
  final int humidity;
  final double windSpeed;
  final double feelsLike;
  final String cityName;
  final String weatherMain;
  final String weatherDescription;

  const Weather({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLike,
    required this.cityName,
    required this.weatherMain,
    required this.weatherDescription,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      cityName: json['name'],
      weatherMain: json['weather'][0]['main'],
      weatherDescription: json['weather'][0]['description'],
    );
  }
}