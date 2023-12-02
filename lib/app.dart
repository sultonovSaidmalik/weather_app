import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/ipis/service_locator.dart';
import 'package:weather_app/src/screens/home_screen/home_screen.dart';
import 'src/screens/home_screen/bloc/home_bloc/home_bloc.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      home: BlocProvider(
        create: (BuildContext context) {
          return locator<HomeBloc>()..add(const HomeWeather());
        },
        child: const HomeScreen(),
      ),
    );
  }
}
