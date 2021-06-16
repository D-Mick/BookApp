// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

import 'package:book_app/Model/search_info.dart';
import 'package:book_app/Model/volume_info.dart';
class Book {
  Book({
    this.items,
  });

  List<Item> items;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
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

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: json["kind"] == null ? null : json["kind"],
    id: json["id"] == null ? null : json["id"],
    etag: json["etag"] == null ? null : json["etag"],
    selfLink: json["selfLink"] == null ? null : json["selfLink"],
    volumeInfo: json["volumeInfo"] == null ? null : VolumeInfo.fromJson(json["volumeInfo"]),
    searchInfo: json["searchInfo"] == null ? null : SearchInfo.fromJson(json["searchInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind == null ? null : kind,
    "id": id == null ? null : id,
    "etag": etag == null ? null : etag,
    "selfLink": selfLink == null ? null : selfLink,
    "volumeInfo": volumeInfo == null ? null : volumeInfo.toJson(),
    "searchInfo": searchInfo == null ? null : searchInfo.toJson(),
  };
}


