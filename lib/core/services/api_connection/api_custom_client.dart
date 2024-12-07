import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maids/core/services/api_connection/api_error_handler.dart';


class ApiClientDio {
  static const baseURL = "https://dummyjson.com/auth/login";

  static Dio? dio;

  static Dio getApiClientDio() {
    if (ApiClientDio.dio != null) return ApiClientDio.dio!;
    final dio = Dio(); // Provide a dio instance
    dio.options.validateStatus = (b) {
      return b == 200;
    };
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // var token = GetStorage().read(GetStorageConstants.apiToken);
        // var userType = GetStorage().read(GetStorageConstants.type);
        // var language = GetStorage().read(LanguageControllerMixin.languageKey);

        if (kDebugMode) {
          // print("‍💻 Api Token: $token 💻");
          // print("‍💻 Authenticated Provider: $userType 💻");
          // print("Api Path: ${options.path}");
        }
        Map<String, String> map = {
          // if (token != null) 'Authorization': "Bearer $token",
          // if (userType != null) 'AuthenticatedProvider': "$userType",
          // 'Accept-Language': language == "Arabic" ? "ar" : "en",
          // 'Accept': 'application/json',
          // 'Content-Type': 'application/json',
        };
        options.headers.addEntries(map.entries);
        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        if (kDebugMode) {
          print("⬇️ Api Path: ${response.requestOptions.path} ⬇️");
          print("⬇️ Api query: ${response.requestOptions.queryParameters} ⬇️");
          print("⬇️ Api response: ${response.data} ⬇️");
        }
        // if (response.data is String) {
        //   response.data = parseJsonFromString(response.data);
        // }
        // if (response.data.containsKey("result")) {
        //   return handler.next(response); // continue
        //   response.data = response.data["result"];
        //   if (response.data is Map && response.data.containsKey("data")) {
        //     response.data = response.data["data"];
        //   }
        // }
        return handler.next(response); // continue
      },
      onError: (DioError e, handler) {
        // if (e.response?.statusCode == 401) {
        //   BaseLocalDataSourceImpl.logOutUser();
        //   GetLib.Get.deleteAll();
        //   GetLib.Get.offAll(LoginPage());
        // }
        if (kDebugMode) {
          print("❌ Error Path: ${e.requestOptions.path} ❌");
          print("❌ Error response: ${e.response} ❌");
        }
        var message = e.response?.data?["error"] ??
            e.response?.data?["message"] ??
            "Conncetion Error: ${e.response?.requestOptions.path ?? "${e.response?.statusCode ?? 000}"}";

        var apiError = ApiError(
          e,
          message,
          0,
        );
        // if (e.response?.statusCode == 400 &&
        //     e.response?.data?["errorMessage"] == 'UserNotFound') {
        //   GetStorage().write(GetStorageConstants.apiToken, null);
        //   GetStorage().write(GetStorageConstants.isRegistered, false);
        //   GetStorage().write(GetStorageConstants.isConfirmed, false);
        //   Get.offAll(() => LoginPage());
        // }

        return handler.next(apiError); //continue
      },
    ));
    // final client = RestClientApi(dio);
    ApiClientDio.dio = dio;
    return dio;
  }

  static Map<String, dynamic> parseJsonFromString(String jsonString) {
    try {
      return json.decode(jsonString);
    } catch (e) {
      print('Error parsing JSON: $e');
      return {};
    }
  }
}
