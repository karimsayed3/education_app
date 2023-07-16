
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:education_app/core/network/network_exceptions.dart';

part 'lessons_state.freezed.dart';

@freezed
class LessonsState<T> with _$LessonsState<T> {

  const factory LessonsState.idle() = Idle<T> ;

  const factory LessonsState.loading() = Loading<T> ;
  const factory LessonsState.success(T data) = Success<T> ;
  const factory LessonsState.error(NetworkExceptions networkExceptions) = Error<T> ;
}
