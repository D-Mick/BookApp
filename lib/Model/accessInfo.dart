class AccessInfo {
  AccessInfo({
    this.webReaderLink,
  });

  String webReaderLink;

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
    webReaderLink: json["webReaderLink"] == null ? null : json["webReaderLink"],
  );

  Map<String, dynamic> toJson() => {
    "webReaderLink": webReaderLink == null ? null : webReaderLink,
  };
}