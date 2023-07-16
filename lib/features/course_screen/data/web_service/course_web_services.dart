import 'package:dio/dio.dart';
import 'package:education_app/features/course_screen/data/model/course_data_model.dart';
import 'package:retrofit/retrofit.dart';

part 'course_web_services.g.dart';

@RestApi(baseUrl: "https://course-api-6k8w.onrender.com/course/")
abstract class CoursesWebServices {
  factory CoursesWebServices(Dio dio, {String baseUrl}) = _CoursesWebServices;


  @GET("getAllCoursesByCategoryId/{categoryId}")
  Future<CourseDataModel> getHomeDataCoursesByCategoryId(@Path('categoryId')String categoryId,@Header('Authorization')String token);
}