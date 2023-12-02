part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  const HomeState();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeInitial && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeLoadingState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class HomeSuccessWeatherState extends HomeState {
  final  WeatherResponse weather;
  const HomeSuccessWeatherState({required this.weather});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeSuccessWeatherState &&
          runtimeType == other.runtimeType &&
          weather == other.weather;

  @override
  int get hashCode => weather.hashCode;
}

class HomeErrorState extends HomeState{
  const HomeErrorState();
}

