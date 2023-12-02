
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../common/model/weather_repo.dart';
import '../../../../common/repositories/weather_repo.dart';



part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherRepository repository;
  HomeBloc(this.repository) : super(const HomeInitial()) {
    on<HomeEvent>((event, emit) => switch(event) {
      HomeWeather e => _getWeather(e, emit),
      _ => () {
        print("Error Not Found Bloc Event");
      },
    });
  }


  void _getWeather(HomeWeather event, Emitter emit) async {
    emit(const HomeLoadingState());
    final result = await repository.getWeathers();
    if(result != null) {
      emit(HomeSuccessWeatherState(weather: result));
    } else {
      emit(const HomeErrorState());
    }
    print(result);
  }


}
// Data => UI
// Repostiroy => Bloc => Event => Bloc Function => State > UI
