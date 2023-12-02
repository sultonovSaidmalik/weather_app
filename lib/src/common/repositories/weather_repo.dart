import 'package:dio/dio.dart';

import '../../core/ipis/apis.dart';
import '../../core/services/dio_service.dart';
import '../model/weather_repo.dart';

abstract class WeatherRepository {
  Future<List<WeatherResponse>> getWeather();

  Future<WeatherResponse?> getWeathers();
}

class WeatherRepositoryImpl extends WeatherRepository {
  final Network client;

  WeatherRepositoryImpl({required this.client});

  @override
  Future<WeatherResponse?> getWeathers() async {
    final json = await client.get(api: Apis.weather, query: Apis.query());
    if(json is Map<String , dynamic>) {
      return WeatherResponse.fromJson(json);
    }else {
      return null;
    }
  }

  @override
  Future<List<WeatherResponse>> getWeather() async {
    final json = await client.get(api: Apis.weather) as List;
    return json
        .map((item) => WeatherResponse.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}

void main() {

}
