import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/screens/weather_screen.dart';

import 'bloc/weather_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(25, 123, 211, 1),
        accentColor: Color.fromRGBO(185, 183, 211, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<WeatherBloc>(
        lazy: false,
        create: (context) => WeatherBloc(),
        child: WeatherScreen(),
      ),
    );
  }
}
