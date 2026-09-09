import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService weatherService;

  WeatherBloc(this.weatherService) : super(WeatherInitial()) {
    on<SearchWeather>((event, emit) async {
      emit(WeatherLoading());

      try {
        final data = await weatherService.getWeather(event.city);

        final weather = Weather.fromJson(data);

        emit(WeatherLoaded(weather));
      } catch (e) {
        emit(WeatherError('Could not load weather data.'));
      }
    });
  }
}