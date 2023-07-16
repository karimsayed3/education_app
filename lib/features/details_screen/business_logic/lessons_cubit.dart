import 'package:education_app/features/details_screen/business_logic/lessons_state.dart';
import 'package:education_app/features/details_screen/data/model/lessons_data_model.dart';
import 'package:education_app/features/details_screen/data/repository/lessons_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonsCubit extends Cubit<LessonsState<LessonsDataModel>> {
  LessonsRepository lessonsRepository;

  LessonsCubit(this.lessonsRepository) : super(Idle());

  static LessonsCubit get(context) => BlocProvider.of(context);

  getLessonsById({
    required String courseId,
    required String token,
  }) async {
    emit(LessonsState.loading());
    var data = await lessonsRepository.getLessonsById(courseId, token);
    print(data.toString());
    data.when(
      success: (data) {
        emit(LessonsState.success(data));
      },
      failure: (networkExceptions) {
        emit(LessonsState.error(networkExceptions));
      },
    );
  }
}
