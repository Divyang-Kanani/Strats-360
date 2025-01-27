import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:strats_360/model/listing_response_model_entity.dart';
import 'package:strats_360/pages/single_screen/model/single_user_model_entity.dart';
import 'package:strats_360/utils/app_const.dart';

part 'api_rest_client.g.dart';

@RestApi()
abstract class ApiRestClient {
  factory ApiRestClient(Dio dio, {String baseUrl}) = _ApiRestClient;

  @GET(AppConst.userEndPoint)
  Future<ListingResponseModelEntity> getUserListing(
      {@Query("page") required int page});

  @GET("${AppConst.userEndPoint}/{id}")
  Future<SingleUserModelEntity> getUserFromId({@Path("id") required int id});
}
