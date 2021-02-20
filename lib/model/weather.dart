class Weather {
  String cityName;
  double temperature;

  Weather({this.cityName, this.temperature});

  factory Weather.parseJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json["name"],
      temperature: json["main"]["temp"],
    );
  }
}
