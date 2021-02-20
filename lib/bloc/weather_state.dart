part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  WeatherState() : super();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded({this.weather});
  @override
  List<Object> get props => [this.weather];
}

class WeatherError extends WeatherState {}
