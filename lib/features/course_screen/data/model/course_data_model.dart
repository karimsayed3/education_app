import 'package:freezed_annotation/freezed_annotation.dart';
part 'course_data_model.g.dart';

@JsonSerializable()

class CourseDataModel {
  String? status;
  String? message;
  List<Data>? data;

  CourseDataModel({this.status, this.message, this.data});


  factory CourseDataModel.fromJson(Map<String, dynamic> json) => _$CourseDataModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CourseDataModelToJson(this);

}

class Data {
  String? sId;
  String? name;
  int? completedPercentage;
  String? author;
  String? image;
  bool? favourite;
  String? categoryId;

  Data(
      {this.sId,
        this.name,
        this.completedPercentage,
        this.author,
        this.image,
        this.favourite,
        this.categoryId});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    completedPercentage = json['completedPercentage'];
    author = json['author'];
    image = json['image'];
    favourite = json['favourite'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['completedPercentage'] = this.completedPercentage;
    data['author'] = this.author;
    data['image'] = this.image;
    data['favourite'] = this.favourite;
    data['category_id'] = this.categoryId;
    return data;
  }
}
