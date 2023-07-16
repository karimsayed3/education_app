import 'package:dio/dio.dart';
import 'package:education_app/features/course_screen/bussines_logic/courses_cubit.dart';
import 'package:education_app/features/course_screen/data/repository/course_repository.dart';
import 'package:education_app/features/course_screen/data/web_service/course_web_services.dart';
import 'package:education_app/features/details_screen/business_logic/lessons_cubit.dart';
import 'package:education_app/features/details_screen/data/repository/lessons_repository.dart';
import 'package:education_app/features/details_screen/data/web_services/lessons_web_services.dart';
import 'package:education_app/features/feature_screen/bussines_logic/feature_cubit.dart';
import 'package:education_app/features/feature_screen/data/repository/home_repository.dart';
import 'package:education_app/features/feature_screen/data/web_srevices/feature_web_service.dart';
import 'package:education_app/features/home_screen/bussines_logic/home_screen_cubit.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;
void initGetIt() {
  getIt.registerLazySingleton<HomeScreenCubit>(() => HomeScreenCubit());
  // getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  // getIt.registerLazySingleton<WebServices>(() => WebServices(createAndSetupDio()));

  getIt.registerLazySingleton<FeatureCubit>(() => FeatureCubit(getIt()));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));
  getIt.registerLazySingleton<HomeWebServices>(() => HomeWebServices(createAndSetupDio()));

  getIt.registerLazySingleton<CoursesCubit>(() => CoursesCubit(getIt()));
  getIt.registerLazySingleton<CourseRepository>(() => CourseRepository(getIt()));
  getIt.registerLazySingleton<CoursesWebServices>(() => CoursesWebServices(createAndSetupDio()));

  getIt.registerLazySingleton<LessonsCubit>(() => LessonsCubit(getIt()));
  getIt.registerLazySingleton<LessonsRepository>(() => LessonsRepository(getIt()));
  getIt.registerLazySingleton<LessonsWebServices>(() => LessonsWebServices(createAndSetupDio()));
}

createAndSetupDio(){
  Dio dio = Dio();

  dio..options.connectTimeout = const Duration(minutes: 5)
    ..options.receiveTimeout = const Duration(minutes: 5) ;
  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request : true,
    requestBody : true,
  ));
  return dio;
}