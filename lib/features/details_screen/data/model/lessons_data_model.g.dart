// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonsDataModel _$LessonsDataModelFromJson(Map<String, dynamic> json) =>
    LessonsDataModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LessonsDataModelToJson(LessonsDataModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
