import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class CityInput extends StatelessWidget {
  const CityInput({
    Key key,
    @required this.textFieldController,
  }) : super(key: key);

  final TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: textFieldController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(Icons.search_rounded),
                onPressed: () {
                  context
                      .read<WeatherBloc>()
                      .add(GetWeatherEvent(city: textFieldController.text));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
