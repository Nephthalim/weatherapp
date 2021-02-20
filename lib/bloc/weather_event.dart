// import 'package:weather_app/cubit/bloc/weather_state.dart';
part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherEvent extends WeatherEvent {
  final String city;
  GetWeatherEvent({this.city});
  @override
  List<Object> get props => [this.city];
}

class LoadingWeatherEvent extends WeatherEvent {}

class LoadedWeatherEvent extends WeatherEvent {}
