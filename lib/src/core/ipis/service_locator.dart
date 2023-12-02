import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/src/common/repositories/weather_repo.dart';
import '../../screens/home_screen/bloc/home_bloc/home_bloc.dart';
import '../services/dio_service.dart';


final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  /// network
  final dio = Dio();
  final networkService = DioService(dio: dio);

  locator.registerLazySingleton<Network>(() {
    return networkService;
  });




  //Repositories
  locator.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(client: locator()));
  // Blocs
  locator.registerFactory(() => HomeBloc(locator()));
}