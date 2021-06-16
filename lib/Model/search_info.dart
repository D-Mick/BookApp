class SearchInfo {
  SearchInfo({
    this.textSnippet,
  });

  String textSnippet;

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
    textSnippet: json["textSnippet"] == null ? null : json["textSnippet"],
  );

  Map<String, dynamic> toJson() => {
    "textSnippet": textSnippet == null ? null : textSnippet,
  };
}