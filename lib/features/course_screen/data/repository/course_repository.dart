// ignore_for_file: non_constant_identifier_names

import 'package:education_app/core/network/api_result.dart';
import 'package:education_app/core/network/network_exceptions.dart';
import 'package:education_app/features/course_screen/data/model/course_data_model.dart';
import 'package:education_app/features/course_screen/data/web_service/course_web_services.dart';


class CourseRepository {
  final CoursesWebServices webServices;

  CourseRepository(this.webServices);

  Future<ApiResult<CourseDataModel>> getHomeDataCoursesByCategoryId(String categoryId , String token)async {
    try {
      var response = await webServices.getHomeDataCoursesByCategoryId(categoryId , token);
      return  ApiResult.success(response) ;
    }catch(error){
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

}