// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDataModel _$CourseDataModelFromJson(Map<String, dynamic> json) =>
    CourseDataModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseDataModelToJson(CourseDataModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
