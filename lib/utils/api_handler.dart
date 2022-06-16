import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';

enum APIMethod { post, put, get, delete, patch }

class ApiHandler {
  //to make the class singleton and create only one instance:
  ApiHandler._internal();

  static final ApiHandler instance = ApiHandler._internal();

  factory ApiHandler() => instance;

  static const _baseUrl = 'https://api.themoviedb.org/3/';
  static const imageBaseUrl = 'https://image.tmdb.org/t/p/original';
  static const _apiKey = '0656e42add14c54ec59c8109e5d6e50b';
  static const _lang = 'en-US';

  final Dio _dio = Dio();


  Future<dynamic> call({
     String path,
     APIMethod method,
    int page = 1,
    Map<String, dynamic> body,
  }) async {
    try {
      final url = '$_baseUrl$path?api_key=$_apiKey&language=$_lang&page=$page';
      //to cache api response:
      DioCacheManager dioCacheManager;
      dioCacheManager = DioCacheManager(CacheConfig());
      Options cacheOptions = buildCacheOptions(const Duration(days: 7));
      _dio.interceptors.add(dioCacheManager.interceptor);
      //-----------------------------------------------------------------
      Response response;
      switch (method) {
        case APIMethod.post:
          response = await _dio.post(
            url,
            data: body,
            options: cacheOptions,
          );
          break;
        case APIMethod.put:
          response = await _dio.put(
            url,
            data: body,
          );
          break;
        case APIMethod.get:
          response = await _dio.get(
              url,
            options: cacheOptions,
          );
          break;
        case APIMethod.delete:
          _dio.options.headers.remove("content-type");
          response = await _dio.delete(
            url,
            data: body,
          );
          break;
        case APIMethod.patch:
          response = await _dio.patch(
            url,
            data: body,
          );
          break;
      }

      return response.data;
    } on FormatException catch (formatError) {
      if (kDebugMode) {
        log('FormatException : ${formatError.message}');
      }
      throw 'api error exception';
    } on DioError catch (dioError) {
      throw dioError.error.toString();
    }
  }
}
