import 'package:strats_360/generated/json/base/json_convert_content.dart';
import 'package:strats_360/model/listing_response_model_entity.dart';

ListingResponseModelEntity $ListingResponseModelEntityFromJson(
    Map<String, dynamic> json) {
  final ListingResponseModelEntity listingResponseModelEntity =
      ListingResponseModelEntity();
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    listingResponseModelEntity.page = page;
  }
  final int? perPage = jsonConvert.convert<int>(json['per_page']);
  if (perPage != null) {
    listingResponseModelEntity.perPage = perPage;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    listingResponseModelEntity.total = total;
  }
  final int? totalPages = jsonConvert.convert<int>(json['total_pages']);
  if (totalPages != null) {
    listingResponseModelEntity.totalPages = totalPages;
  }
  final List<ListingResponseModelData>? data = (json['data'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<ListingResponseModelData>(e)
          as ListingResponseModelData)
      .toList();
  if (data != null) {
    listingResponseModelEntity.data = data;
  }
  final ListingResponseModelSupport? support =
      jsonConvert.convert<ListingResponseModelSupport>(json['support']);
  if (support != null) {
    listingResponseModelEntity.support = support;
  }
  return listingResponseModelEntity;
}

Map<String, dynamic> $ListingResponseModelEntityToJson(
    ListingResponseModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['page'] = entity.page;
  data['per_page'] = entity.perPage;
  data['total'] = entity.total;
  data['total_pages'] = entity.totalPages;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['support'] = entity.support?.toJson();
  return data;
}

extension ListingResponseModelEntityExtension on ListingResponseModelEntity {
  ListingResponseModelEntity copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<ListingResponseModelData>? data,
    ListingResponseModelSupport? support,
  }) {
    return ListingResponseModelEntity()
      ..page = page ?? this.page
      ..perPage = perPage ?? this.perPage
      ..total = total ?? this.total
      ..totalPages = totalPages ?? this.totalPages
      ..data = data ?? this.data
      ..support = support ?? this.support;
  }
}

ListingResponseModelData $ListingResponseModelDataFromJson(
    Map<String, dynamic> json) {
  final ListingResponseModelData listingResponseModelData =
      ListingResponseModelData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    listingResponseModelData.id = id;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    listingResponseModelData.email = email;
  }
  final String? firstName = jsonConvert.convert<String>(json['first_name']);
  if (firstName != null) {
    listingResponseModelData.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['last_name']);
  if (lastName != null) {
    listingResponseModelData.lastName = lastName;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    listingResponseModelData.avatar = avatar;
  }
  return listingResponseModelData;
}

Map<String, dynamic> $ListingResponseModelDataToJson(
    ListingResponseModelData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['email'] = entity.email;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['avatar'] = entity.avatar;
  return data;
}

extension ListingResponseModelDataExtension on ListingResponseModelData {
  ListingResponseModelData copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return ListingResponseModelData()
      ..id = id ?? this.id
      ..email = email ?? this.email
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName
      ..avatar = avatar ?? this.avatar;
  }
}

ListingResponseModelSupport $ListingResponseModelSupportFromJson(
    Map<String, dynamic> json) {
  final ListingResponseModelSupport listingResponseModelSupport =
      ListingResponseModelSupport();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    listingResponseModelSupport.url = url;
  }
  final String? text = jsonConvert.convert<String>(json['text']);
  if (text != null) {
    listingResponseModelSupport.text = text;
  }
  return listingResponseModelSupport;
}

Map<String, dynamic> $ListingResponseModelSupportToJson(
    ListingResponseModelSupport entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['text'] = entity.text;
  return data;
}

extension ListingResponseModelSupportExtension on ListingResponseModelSupport {
  ListingResponseModelSupport copyWith({
    String? url,
    String? text,
  }) {
    return ListingResponseModelSupport()
      ..url = url ?? this.url
      ..text = text ?? this.text;
  }
}
