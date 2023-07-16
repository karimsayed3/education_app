import 'package:freezed_annotation/freezed_annotation.dart';
part 'lessons_data_model.g.dart';

@JsonSerializable()
class LessonsDataModel {
  String? status;
  String? message;
  List<Data>? data;

  LessonsDataModel({this.status, this.message, this.data});

  factory LessonsDataModel.fromJson(Map<String, dynamic> json) => _$LessonsDataModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LessonsDataModelToJson(this);

}

class Data {
  String? sId;
  String? description;
  List<Lessons>? lessons;
  String? courseId;

  Data({this.sId, this.description, this.lessons, this.courseId});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(new Lessons.fromJson(v));
      });
    }
    courseId = json['course_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    if (this.lessons != null) {
      data['lessons'] = this.lessons!.map((v) => v.toJson()).toList();
    }
    data['course_id'] = this.courseId;
    return data;
  }
}

class Lessons {
  String? name;
  dynamic? timer;
  String? url;
  String? sId;

  Lessons({this.name, this.timer, this.url, this.sId});

  Lessons.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    timer = json['timer'];
    url = json['url'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['timer'] = this.timer;
    data['url'] = this.url;
    data['_id'] = this.sId;
    return data;
  }
}
