import 'dart:io';

import 'package:dio/dio.dart';
import 'package:maids/core/data/models/login_data/login_data.dart';
import 'package:maids/core/services/api_connection/api_custom_client.dart';
import 'package:maids/core/services/api_connection/base_responses/data_base_response/data_base_response.dart';
import 'package:maids/core/services/api_connection/base_responses/page_base_response/page_base_response.dart';
import 'package:retrofit/retrofit.dart';


import 'api_connection.dart';
import 'api_custom_client.dart';

class AppRepository {
  final ApiConnection restClient = ApiConnection(
    ApiClientDio.getApiClientDio(),
    baseUrl: ApiClientDio.baseURL,
  );

  AppRepository();

  Future<LoginData?> login({
    required String username,
    required String password,
  }) async {
    return (await restClient.login(username, password)).data;
  }

  // Future<PageBaseResponse<List<Family>>?> getParentsForSchool(int page) async {
  //   return (await restClient.getParentsForSchool(page)).data;
  // }


}
