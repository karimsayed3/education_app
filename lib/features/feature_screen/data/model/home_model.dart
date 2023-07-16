import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_model.g.dart';

@JsonSerializable()
class HomeDataModel {
  String? status;
  String? message;
  List<Data>? data;

  HomeDataModel({this.status, this.message, this.data});

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => _$HomeDataModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$HomeDataModelToJson(this);

}

class Data {
  String? sId;
  String? name;
  int? noOfCourses;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.name,
        this.noOfCourses,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    noOfCourses = json['noOfCourses'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['noOfCourses'] = this.noOfCourses;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }

}
