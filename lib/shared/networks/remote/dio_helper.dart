import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../components/constants.dart';

class DioHelper {
  late Dio dio;

  DioHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 20*1000,
        receiveTimeout: 20*1000,

      ),
    );
  }

  Future getDataFromApi({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    try {
      return await dio.get(url, queryParameters: query);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

  Future postDataIntoApi({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    try {
      return await dio.post(url, queryParameters: query,);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
