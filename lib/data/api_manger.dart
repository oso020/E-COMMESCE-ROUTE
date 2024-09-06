import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@singleton
class ApiManger {
  late Dio dio;

  ApiManger(){
    dio=Dio( BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {'Content-Type': 'application/json'},
      responseType: ResponseType.json,
      validateStatus: (status) => true,
    ),
    );
  }


  Future<Response> postData(String apiName,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) async {


    var response=await dio.post(apiName,
        data: body, options: Options(headers: headers));

    return response;
  }

  Future<Response> getData(String apiName,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) async {


    var response=await dio.get(apiName,
        data: body, options: Options(headers: headers));

    return response;
  }

}
