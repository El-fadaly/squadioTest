import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:squadio_test/config/api_urls.dart';

import 'logger.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

class HttpService {
  Dio? _dio;

  // static header() => {
  //       "Content-Type": "text/plain",
  //       // "Accept": "*/*",
  //       "Authorization": "Basic ZW12T3AwMmxCVEFDOTdNUzplbXZPcDAybEJUQUM5N01T",
  //       'lang': Get.locale?.languageCode == "en" ? "en_US" : "ar_001",
  //       // "Cookie": "session_id=3cf3839fd28d0e3524c4752f1be473a5fb68c813"
  //     };

  Future<HttpService> init() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiUrls.baseUrl,
        // headers: header(),
      ),
    );
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          print("\n===================== requestOptions =====================");

          logger.i(
              "REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
              "=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers} => DATA: ${requestOptions.data}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          logger
              .i("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          logger.i("Error[${err.response?.statusCode}]");
          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> request({
    required String url,
    required Method method,
    Map<String, dynamic>? header,
    formData,
    Map<String, dynamic>? params,
    bool isfile = false,
    bool isQueryParam = false,
  }) async {
    Response response;

    try {
      if (method == Method.POST) {
        print("params httpService ${params.toString()}");
        if (isfile) {
          response = await _dio!.post(
            url,
            data: formData,
            options: Options(headers: header),
          );
        } else {
          if (isQueryParam) {
            response = await _dio!.post(
              url,
              queryParameters: params,
              options: Options(headers: header),
            );
          } else {
            response = await _dio!.post(
              url,
              data: json.encode(params),
              options: Options(headers: header),
            );
          }
        }
      } else if (method == Method.PUT) {
        if (isQueryParam) {
          response = await _dio!.put(
            url,
            queryParameters: params,
            options: Options(headers: header),
          );
        } else {
          response = await _dio!.put(
            url,
            data: json.encode(params),
            options: Options(headers: header),
          );
        }
      } else if (method == Method.DELETE) {
        response = await _dio!.delete(
          url,
          data: json.encode(params),
          options: Options(headers: header),
        );
      } else if (method == Method.PATCH) {
        response = await _dio!.patch(url);
      } else {
        response = await _dio!.get(
          url,
          queryParameters: params,
          options: Options(headers: header),
        );
      }

      print(response.statusCode);

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        print("resp " + response.data);
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something does wen't wrong");
      }
    } on SocketException catch (e) {
      logger.e(e);
      throw Exception("Not Internet Connection");
    } on FormatException catch (e) {
      logger.e(e);
      throw Exception("Bad response format");
    } on DioError catch (e) {
      logger.e(e);
      if (e.response!.statusCode == 401) {
        throw Exception(e.response!.data['message']);
      } else if (e.response!.statusCode == 404) {
        throw Exception(e.response!.data['message']);
      } else {
        throw Exception(e);
      }
    } catch (e) {
      logger.e(e);
      throw Exception("Something wen't wrong");
    }
  }
}
