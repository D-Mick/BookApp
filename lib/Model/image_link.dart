class ImageLinks {
  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  String smallThumbnail;
  String thumbnail;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
    smallThumbnail: json["smallThumbnail"] == null ? null : json["smallThumbnail"],
    thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "smallThumbnail": smallThumbnail == null ? null : smallThumbnail,
    "thumbnail": thumbnail == null ? null : thumbnail,
  };
}