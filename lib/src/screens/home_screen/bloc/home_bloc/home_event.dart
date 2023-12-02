part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

class HomeWeather extends HomeEvent {
  const HomeWeather();
}
