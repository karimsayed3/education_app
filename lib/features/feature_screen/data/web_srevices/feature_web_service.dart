import 'package:dio/dio.dart';
import 'package:education_app/features/feature_screen/data/model/home_model.dart';
import 'package:retrofit/retrofit.dart';

part 'feature_web_service.g.dart';

@RestApi(baseUrl: "https://course-api-6k8w.onrender.com/category/cat/")
abstract class HomeWebServices {
  factory HomeWebServices(Dio dio, {String baseUrl}) = _HomeWebServices;


  @GET("getAllCategories")
  Future<HomeDataModel> getHomeData(@Header('Authorization')String token);
}