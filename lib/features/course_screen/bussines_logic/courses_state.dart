

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:education_app/core/network/network_exceptions.dart';

part 'courses_state.freezed.dart';

@freezed
class CoursesState<T> with _$CoursesState<T> {

  const factory CoursesState.idle() = Idle<T> ;

  const factory CoursesState.loading() = Loading<T> ;
  const factory CoursesState.success(T data) = Success<T> ;
  const factory CoursesState.error(NetworkExceptions networkExceptions) = Error<T> ;
}
