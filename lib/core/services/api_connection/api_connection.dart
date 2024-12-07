import 'dart:io';

import 'package:dio/dio.dart';
import 'package:maids/core/services/api_connection/base_responses/data_base_response/data_base_response.dart';
import 'package:maids/core/services/api_connection/base_responses/page_base_response/page_base_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../data/models/login_data/login_data.dart';
import 'api_custom_client.dart';

part 'api_connection.g.dart';

@RestApi(baseUrl: ApiClientDio.baseURL)
abstract class ApiConnection {
  factory ApiConnection(Dio dio, {String baseUrl}) = _ApiConnection;

  @POST("/auth/login")
  Future<DataBaseResponse<LoginData>> login(
    @Field() String username,
    @Field() String password,
  );

}
