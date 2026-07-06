class Weather {
  final double temperature;
  final int humidity;
  final double windSpeed;
  final double feelsLike;

  const Weather({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLike,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final current = json['current'];

    return Weather(
      temperature: current['temperature_2m'].toDouble(),
      humidity: current['relative_humidity_2m'],
      windSpeed: current['wind_speed_10m'].toDouble(),
      feelsLike: current['apparent_temperature'].toDouble(),
    );
  }
}