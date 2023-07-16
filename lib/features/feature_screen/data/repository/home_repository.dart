// ignore_for_file: non_constant_identifier_names

import 'package:education_app/core/network/api_result.dart';
import 'package:education_app/core/network/network_exceptions.dart';
import 'package:education_app/features/feature_screen/data/model/home_model.dart';
import 'package:education_app/features/feature_screen/data/web_srevices/feature_web_service.dart';



class HomeRepository {
  final HomeWebServices webServices;

  HomeRepository(this.webServices);

  Future<ApiResult<HomeDataModel>> getHomeData(String token)async {
    try {
      var response = await webServices.getHomeData(token);
      return  ApiResult.success(response) ;
    }catch(error){
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

}