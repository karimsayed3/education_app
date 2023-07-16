import 'package:freezed_annotation/freezed_annotation.dart';



part 'error_model.g.dart';
@JsonSerializable()
class ErrorModel {
  String? status;
  String? message;
  Data? data;

  ErrorModel({this.status, this.message, this.data});


  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);

}

class Data {
  String? value;
  String? msg;
  String? param;
  String? location;

  Data({this.value, this.msg, this.param, this.location});

  Data.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['msg'] = this.msg;
    data['param'] = this.param;
    data['location'] = this.location;
    return data;
  }
}
