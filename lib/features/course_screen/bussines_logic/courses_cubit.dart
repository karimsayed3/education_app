import 'package:bloc/bloc.dart';
import 'package:education_app/features/course_screen/bussines_logic/courses_state.dart';
import 'package:education_app/features/course_screen/data/model/course_data_model.dart';
import 'package:education_app/features/course_screen/data/repository/course_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesCubit extends Cubit<CoursesState<CourseDataModel>> {
  CourseRepository courseRepository;

  CoursesCubit(this.courseRepository) : super(Idle());

  static CoursesCubit get(context) => BlocProvider.of(context);

  getHomeDataCoursesByCategoryId({
    required String categoryId,
    required String token,
  }) async {
    emit(CoursesState.loading());
    var data = await courseRepository.getHomeDataCoursesByCategoryId(
        categoryId, token);

    data.when(
      success: (data) {
        emit(CoursesState.success(data));
      },
      failure: (networkExceptions) {
        emit(CoursesState.error(networkExceptions));
      },
    );
  }
}
