import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/api_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  Dio dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {'Content-Type': 'application/json'},
      responseType: ResponseType.json,
      validateStatus: (status) => true,
    ),
  );

  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    return dio.get("${ApiConstants.baseUrl}$endPoint",
        queryParameters: queryParameters, options: Options(headers: headers));
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.post("${ApiConstants.baseUrl}$endPoint",
        data: body, options: Options(headers: headers));
  }

  Future<Response> deleteData(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.delete("${ApiConstants.baseUrl}$endPoint",
        data: body, options: Options(headers: headers));
  }

  Future<Response> updateData(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.put("${ApiConstants.baseUrl}$endPoint",
        data: body, options: Options(headers: headers));
  }
}
