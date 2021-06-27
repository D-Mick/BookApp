import 'package:book_app/Model/image_link.dart';

class VolumeInfo {
  VolumeInfo({
    this.title,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
    this.description,
    this.author,
  });

  String title;
  ImageLinks imageLinks;
  String language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;
  String description;
  List<String> author;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    print(json["authors"]);
    return VolumeInfo(
    title: json["title"] == null ? null : json["title"],
    author: json["authors"] == null ? [] : List<String>.from(json["authors"].map((x) => x)),
    description: json["description"] == null ? null : json["description"],
    imageLinks: json["imageLinks"] == null ? null : ImageLinks.fromJson(json["imageLinks"]),
    language: json["language"] == null ? null : json["language"],
    previewLink: json["previewLink"] == null ? null : json["previewLink"],
    infoLink: json["infoLink"] == null ? null : json["infoLink"],
    canonicalVolumeLink: json["canonicalVolumeLink"] == null ? null : json["canonicalVolumeLink"],
  );}
}