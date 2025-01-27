import 'package:strats_360/generated/json/base/json_convert_content.dart';
import 'package:strats_360/pages/single_screen/model/single_user_model_entity.dart';

SingleUserModelEntity $SingleUserModelEntityFromJson(
    Map<String, dynamic> json) {
  final SingleUserModelEntity singleUserModelEntity = SingleUserModelEntity();
  final SingleUserModelData? data =
      jsonConvert.convert<SingleUserModelData>(json['data']);
  if (data != null) {
    singleUserModelEntity.data = data;
  }
  final SingleUserModelSupport? support =
      jsonConvert.convert<SingleUserModelSupport>(json['support']);
  if (support != null) {
    singleUserModelEntity.support = support;
  }
  return singleUserModelEntity;
}

Map<String, dynamic> $SingleUserModelEntityToJson(
    SingleUserModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  data['support'] = entity.support?.toJson();
  return data;
}

extension SingleUserModelEntityExtension on SingleUserModelEntity {
  SingleUserModelEntity copyWith({
    SingleUserModelData? data,
    SingleUserModelSupport? support,
  }) {
    return SingleUserModelEntity()
      ..data = data ?? this.data
      ..support = support ?? this.support;
  }
}

SingleUserModelData $SingleUserModelDataFromJson(Map<String, dynamic> json) {
  final SingleUserModelData singleUserModelData = SingleUserModelData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    singleUserModelData.id = id;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    singleUserModelData.email = email;
  }
  final String? firstName = jsonConvert.convert<String>(json['first_name']);
  if (firstName != null) {
    singleUserModelData.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['last_name']);
  if (lastName != null) {
    singleUserModelData.lastName = lastName;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    singleUserModelData.avatar = avatar;
  }
  return singleUserModelData;
}

Map<String, dynamic> $SingleUserModelDataToJson(SingleUserModelData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['email'] = entity.email;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['avatar'] = entity.avatar;
  return data;
}

extension SingleUserModelDataExtension on SingleUserModelData {
  SingleUserModelData copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return SingleUserModelData()
      ..id = id ?? this.id
      ..email = email ?? this.email
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName
      ..avatar = avatar ?? this.avatar;
  }
}

SingleUserModelSupport $SingleUserModelSupportFromJson(
    Map<String, dynamic> json) {
  final SingleUserModelSupport singleUserModelSupport =
      SingleUserModelSupport();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    singleUserModelSupport.url = url;
  }
  final String? text = jsonConvert.convert<String>(json['text']);
  if (text != null) {
    singleUserModelSupport.text = text;
  }
  return singleUserModelSupport;
}

Map<String, dynamic> $SingleUserModelSupportToJson(
    SingleUserModelSupport entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['text'] = entity.text;
  return data;
}

extension SingleUserModelSupportExtension on SingleUserModelSupport {
  SingleUserModelSupport copyWith({
    String? url,
    String? text,
  }) {
    return SingleUserModelSupport()
      ..url = url ?? this.url
      ..text = text ?? this.text;
  }
}
