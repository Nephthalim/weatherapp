import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/widgets/city_input_widget.dart';
// import 'package:weather_app/repository/weather_repository.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget errorWidget = const Center(
      child: Text(
        "Seems like there was an error",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );

    Widget initialWidget = const Center(
      child: Text(
        "Enter a city below",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherInitial) {
                        return initialWidget;
                      }
                      if (state is WeatherLoading) {
                        return Center(child: const CircularProgressIndicator());
                      } else if (state is WeatherLoaded) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.location_pin,
                                  size: 56,
                                ),
                                Text(
                                  state.weather.cityName,
                                  style: TextStyle(
                                    fontSize: 48,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${(state.weather.temperature - 273.15).toStringAsFixed(2)} °C",
                              style: const TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      } else if (state is WeatherError) {
                        return errorWidget;
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                CityInput(textFieldController: textFieldController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
