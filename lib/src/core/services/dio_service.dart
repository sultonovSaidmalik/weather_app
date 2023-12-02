import 'package:dio/dio.dart';
import 'package:weather_app/src/core/ipis/apis.dart';
import 'log_service.dart';

abstract class Network {
  const Network();

  Future<Object?> get({required String api, Map<String, String>? query, String? id});
  Future<Object?> post({required String api, required Map<String, Object?> data});
  Future<Object?> put({required String api, required Map<String, Object?> data, required String id});
  Future<Object?> patch({required String api, required Map<String, Object?> data, required String id});
  Future<Object?> delete({required String api, required String id});
}

class DioService extends Network{
  final Dio dio;
   DioService({required this.dio}){
    dio.options = BaseOptions(
      baseUrl: Apis.baseUrl,
      connectTimeout: const Duration(seconds: 4),
      receiveTimeout: const Duration(seconds: 4),
      contentType: Headers.jsonContentType,
    );
  }

  @override
  Future<Object?> get({required String api, Map<String, String>? query, String? id}) async {
    try {
      dio.options.baseUrl = Apis.baseUrl;
      final response = await dio.get("$api${id != null ? "/$id" : ""}", queryParameters: query);
      LogService.d("${response.data}");

      if(response.statusCode == 200 || response.statusCode == 201) {
        // LogService.d("${response.data}");
        return response.data;
      }
    } catch (e) {
      LogService.e("$e");
    }
    return null;
  }

  @override
  Future<Object?> post({required String api, required Map<String, Object?> data}) async {
    try {
      final response = await dio.post(api, data: data);
      LogService.d("${response.data}");

      if(response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } catch (e) {
      LogService.e("$e");
    }
    return null;
  }

  @override
  Future<Object?> patch({required String api, required Map<String, Object?> data, required String id}) async  {
    try {
      final response = await dio.patch("$api/$id", data: data);
      LogService.d("${response.data}");

      if(response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } catch (e) {
      LogService.e("$e");
    }
    return null;
  }

  @override
  Future<Object?> put({required String api, required Map<String, Object?> data, required String id}) async {
    try {
      final response = await dio.put("$api/$id", data: data);
      LogService.d("${response.data}");

      if(response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } catch (e) {
      LogService.e("$e");
    }
    return null;
  }

  @override
  Future<Object?> delete({required String api, required String id}) async {
    try {
      final response = await dio.delete("$api/$id");
      LogService.d("${response.data}");

      if(response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } catch (e) {
      LogService.e("$e");
    }
    return null;
  }
}

