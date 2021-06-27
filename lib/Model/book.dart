// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

import 'dart:convert';

import 'package:book_app/Model/search_info.dart';
import 'package:book_app/Model/volume_info.dart';

List<Items> itemsFromJson(String str) => List<Items>.from(json.decode(str).map((x) => Items.fromJson(x)));

class Items {
  Items({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.searchInfo,
  });

  String kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo volumeInfo;
  SearchInfo searchInfo;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    kind: json["kind"] == null ? null : json["kind"],
    id: json["id"] == null ? null : json["id"],
    etag: json["etag"] == null ? null : json["etag"],
    selfLink: json["selfLink"] == null ? null : json["selfLink"],
    volumeInfo: json["volumeInfo"] == null ? null : VolumeInfo.fromJson(json["volumeInfo"]),
    searchInfo: json["searchInfo"] == null ? null : SearchInfo.fromJson(json["searchInfo"]),
  );
}


