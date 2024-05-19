import 'dart:io';

import 'package:dio/dio.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/data/login/repository/repository.dart';

class DioManager {
  final Map<String, String> _mainheaders = {
    CONTENT_TYPE: APPLICATION_JSON,
    ACCEPT: '*/*',
    AUTHORIZATION: "Bearer $tempToken1",
    DEFAULT_LANGUAGE: 'en',
  };
  // static final DioManager _dioManager = DioManager._internal();
  //
  // factory DioManager.instance() {
  //
  //   return _dioManager;
  // }
  //
  // DioManager._internal();

  updateHeaderToken(String token) {
    _mainheaders.update(AUTHORIZATION, (value) => "Bearer $token");
  }

  Dio dio = Dio(BaseOptions(
    baseUrl: AppConstants.BASE_URL,
    // baseUrl: Platform.isAndroid
    //     ? AppConstants.BASE_URL_LOCAL
    //     : "http://localhost:3001",
    sendTimeout: const Duration(milliseconds: 60000),
    connectTimeout: const Duration(milliseconds: 60000),
    receiveTimeout: const Duration(milliseconds: 60000),
  ));

  // Dio addInterceptors(Dio dio) {
  //   return dio..interceptors.add();
  // }

  addInterceptor(Interceptor interceptor) => dio.interceptors.add(interceptor);

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters, Duration? timeOut}) async {
    print(_mainheaders[AUTHORIZATION]);
    return await dio.get(url,
        queryParameters: queryParameters,
        options: Options(
            headers: _mainheaders,
            receiveTimeout: timeOut,
            sendTimeout: timeOut));
  }

  Future<Response> post(String url,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? additionalHeaders}) async {
    return await dio.post(url,
        data: data,
        options: Options(
          headers: {..._mainheaders, ...?additionalHeaders},
        ));
  }

  Future<Response> patch(String url,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      FormData? formData}) async {
    if (formData != null) {
      return await dio.patch(url,
          data: formData,
          options: Options(
            headers: _mainheaders,
          ),
          queryParameters: params);
    }
    return await dio.patch(url,
        data: data,
        options: Options(
          headers: _mainheaders,
        ));
  }

  Future<Response> delete(String url, {Map<String, dynamic>? data}) async {
    return await dio.delete(url,
        data: data,
        options: Options(
          headers: _mainheaders,
        ));
  }

  static String tempToken1 = "";
}
