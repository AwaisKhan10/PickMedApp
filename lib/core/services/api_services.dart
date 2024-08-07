// ignore_for_file: body_might_complete_normally_catch_error, unnecessary_new, curly_braces_in_flow_control_structures, unnecessary_string_interpolations

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pickmed/core/model/response/request_response.dart';
import 'package:pickmed/core/services/local_storage.dart';
import 'package:pickmed/locator.dart';

class ApiServices {
  Future<Dio> launchDio() async {
    Dio dio = new Dio();
    String? accessToken = locator<LocalStorageService>().accessToken;
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    // dio.interceptors.add(
    //     DioCacheManager(CacheConfig(baseUrl: EndPoint.baseUrl)).interceptor);
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["accept"] = 'application/json';
    dio.options.headers["Authorization"] = 'Bearer $accessToken';

    dio.options.followRedirects = false;
    dio.options.validateStatus = (s) {
      if (s != null)
        return s < 500;
      else
        return false;
    };
    return dio;
  }

  ///
  /// post request
  ///
  postRequest({required String url, data}) async {
    Dio dio = await launchDio();

    try {
      final response = await dio.post('$url', data: data).catchError((e) {
        debugPrint('Unexpected Error $e');
      });
      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (e) {
      return RequestResponse(false,
          error: "An unexpected error occured, please try again.", data: null);
    }
  }

  fatchRequest({required String url, data}) async {
    Dio dio = await launchDio();

    try {
      final response = await dio.patch('$url', data: data).catchError((e) {
        debugPrint('Unexpected Error==> $e');
      });
      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (e) {
      return RequestResponse(false,
          error: "An unexpected error occured, please try again.", data: null);
    }
  }

  ///
  /// Get Request
  ///
  getRequest({required String url, data}) async {
    Dio dio = await launchDio();

    try {
      final response = await dio.get(url, data: data).catchError((e) {
        debugPrint('Unexpected Error==> $e');
      });
      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      }else if (response.statusCode == 404) {
        return RequestResponse(false, error: 'Data Not Found');
      }  else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (e) {
      return RequestResponse(false,
          error: "An unexpected error occured, please try again.", data: null);
    }
  }

  ///
  /// delete request
  ///
  deleteRequest({required String url, params}) async {
    Dio dio = await launchDio();
    try {
      final response =
          await dio.delete("$url", queryParameters: params).catchError((e) {
        debugPrint('Unexpected Error');
      });

      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (e) {
      return RequestResponse(false,
          error: "An unexpected error occured, please try again.", data: null);
    }
  }

  ///
  /// put
  ///
  putRequest({required String url, data}) async {
    Dio dio = await launchDio();
    try {
      final response = await dio.patch("$url", data: data).catchError((e) {
        debugPrint('Unexpected Error');
      });

      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (e) {
      return RequestResponse(false,
          error: "An unexpected error occured, please try again.", data: null);
    }
  }
}
