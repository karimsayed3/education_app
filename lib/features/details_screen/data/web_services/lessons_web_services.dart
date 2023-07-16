import 'package:dio/dio.dart';
import 'package:education_app/features/details_screen/data/model/lessons_data_model.dart';
import 'package:retrofit/retrofit.dart';

part 'lessons_web_services.g.dart';

@RestApi(baseUrl: "https://course-api-6k8w.onrender.com/lesson/")
abstract class LessonsWebServices {
  factory LessonsWebServices(Dio dio, {String baseUrl}) = _LessonsWebServices;


  @GET("getAllLessonsByCourseId/{courseId}")
  Future<LessonsDataModel> getLessonsById(@Path('courseId')String courseId,@Header('Authorization')String token);
}