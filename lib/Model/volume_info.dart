import 'package:book_app/Model/image_link.dart';

class VolumeInfo {
  VolumeInfo({
    this.title,
    this.authors,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  String title;
  List<String> authors;
  ImageLinks imageLinks;
  String language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json["title"] == null ? null : json["title"],
    authors: json["authors"] == null ? null : List<String>.from(json["authors"].map((x) => x)),
    imageLinks: json["imageLinks"] == null ? null : ImageLinks.fromJson(json["imageLinks"]),
    language: json["language"] == null ? null : json["language"],
    previewLink: json["previewLink"] == null ? null : json["previewLink"],
    infoLink: json["infoLink"] == null ? null : json["infoLink"],
    canonicalVolumeLink: json["canonicalVolumeLink"] == null ? null : json["canonicalVolumeLink"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "authors": authors == null ? null : List<dynamic>.from(authors.map((x) => x)),
    "imageLinks": imageLinks == null ? null : imageLinks.toJson(),
    "language": language == null ? null : language,
    "previewLink": previewLink == null ? null : previewLink,
    "infoLink": infoLink == null ? null : infoLink,
    "canonicalVolumeLink": canonicalVolumeLink == null ? null : canonicalVolumeLink,
  };
}