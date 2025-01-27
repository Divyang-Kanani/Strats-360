import 'package:strats_360/generated/json/base/json_field.dart';
import 'package:strats_360/generated/json/single_user_model_entity.g.dart';
import 'dart:convert';
export 'package:strats_360/generated/json/single_user_model_entity.g.dart';

@JsonSerializable()
class SingleUserModelEntity {
  SingleUserModelData? data;
  SingleUserModelSupport? support;

  SingleUserModelEntity();

  factory SingleUserModelEntity.fromJson(Map<String, dynamic> json) =>
      $SingleUserModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $SingleUserModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SingleUserModelData {
  int? id;
  String? email;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  String? avatar;

  SingleUserModelData();

  factory SingleUserModelData.fromJson(Map<String, dynamic> json) =>
      $SingleUserModelDataFromJson(json);

  Map<String, dynamic> toJson() => $SingleUserModelDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SingleUserModelSupport {
  String? url;
  String? text;

  SingleUserModelSupport();

  factory SingleUserModelSupport.fromJson(Map<String, dynamic> json) =>
      $SingleUserModelSupportFromJson(json);

  Map<String, dynamic> toJson() => $SingleUserModelSupportToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
