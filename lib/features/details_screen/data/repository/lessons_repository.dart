// ignore_for_file: non_constant_identifier_names
import 'package:education_app/core/network/api_result.dart';
import 'package:education_app/core/network/network_exceptions.dart';
import 'package:education_app/features/details_screen/data/model/lessons_data_model.dart';
import 'package:education_app/features/details_screen/data/web_services/lessons_web_services.dart';


class LessonsRepository {
  final LessonsWebServices webServices;

  LessonsRepository(this.webServices);

  Future<ApiResult<LessonsDataModel>> getLessonsById(String courseId , String token)async {
    try {
      var response = await webServices.getLessonsById(courseId , token);
      print(response.toString());
      return  ApiResult.success(response) ;
    }catch(error){
      print(error.toString());
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

}