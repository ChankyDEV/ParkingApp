import 'dart:convert';

class SearchResult {
  final String description;

  SearchResult(this.description);

  Map<String, dynamic> toMap() {
    return {
      'description': description,
    };
  }

  factory SearchResult.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SearchResult(
      map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResult.fromJson(String source) =>
      SearchResult.fromMap(json.decode(source));
}
