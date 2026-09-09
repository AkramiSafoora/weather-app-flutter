abstract class WeatherEvent {}

class SearchWeather extends WeatherEvent {
  final String city;

  SearchWeather(this.city);
}