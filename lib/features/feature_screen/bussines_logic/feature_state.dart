

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:education_app/core/network/network_exceptions.dart';

part 'feature_state.freezed.dart';

@freezed
class FeatureState<T> with _$FeatureState<T> {

  const factory FeatureState.idle() = Idle<T> ;

  const factory FeatureState.loading() = Loading<T> ;
  const factory FeatureState.success(T data) = Success<T> ;
  const factory FeatureState.error(NetworkExceptions networkExceptions) = Error<T> ;
}
