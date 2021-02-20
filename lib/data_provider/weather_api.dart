// import 'package:weather_app/model/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WeatherApi {
  //input personal api key here
  String apiKey = "";

  Future getRawWeather(String city) async {
    String url =
        "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey";

    var rawWeather = await http.get(url);

    var response = convert.jsonDecode(rawWeather.body);
    return response;
  }
}
