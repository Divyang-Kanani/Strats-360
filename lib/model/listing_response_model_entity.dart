import 'package:strats_360/generated/json/base/json_field.dart';
import 'package:strats_360/generated/json/listing_response_model_entity.g.dart';
import 'dart:convert';
export 'package:strats_360/generated/json/listing_response_model_entity.g.dart';

@JsonSerializable()
class ListingResponseModelEntity {
  int? page;
  @JSONField(name: "per_page")
  int? perPage;
  int? total;
  @JSONField(name: "total_pages")
  int? totalPages;
  List<ListingResponseModelData>? data;
  ListingResponseModelSupport? support;

  ListingResponseModelEntity();

  factory ListingResponseModelEntity.fromJson(Map<String, dynamic> json) =>
      $ListingResponseModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $ListingResponseModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ListingResponseModelData {
  int? id;
  String? email;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  String? avatar;

  ListingResponseModelData();

  factory ListingResponseModelData.fromJson(Map<String, dynamic> json) =>
      $ListingResponseModelDataFromJson(json);

  Map<String, dynamic> toJson() => $ListingResponseModelDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ListingResponseModelSupport {
  String? url;
  String? text;

  ListingResponseModelSupport();

  factory ListingResponseModelSupport.fromJson(Map<String, dynamic> json) =>
      $ListingResponseModelSupportFromJson(json);

  Map<String, dynamic> toJson() => $ListingResponseModelSupportToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
