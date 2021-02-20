// import 'package:weather_app/cubit/bloc/weather_bloc.dart';
import 'package:weather_app/data_provider/weather_api.dart';
import 'package:weather_app/model/weather.dart';

class WeatherRepository {
  final WeatherApi _weatherApi = WeatherApi();

  Future getWeatherForLocation(String cityName) async {
    final rawWeather = await _weatherApi.getRawWeather(cityName);
    final Weather weather = Weather.parseJson(rawWeather);

    return weather;
  }
}
