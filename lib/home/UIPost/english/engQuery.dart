import 'dart:convert';

class engQuery {
  String engquery;
  String id;
  engQuery({required this.engquery, required this.id});

  List<engQuery> modelQueryFromJson(String str) =>
      List<engQuery>.from(json.decode(str).map((x) => engQuery.fromJson(x)));

  String modelQueryToJson(List<engQuery> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory engQuery.fromJson(Map<dynamic, dynamic> json) {
    return engQuery(engquery: json['queries'], id: json['id']);
  }
  Map<String, dynamic> toJson() => {
        "query": engquery,
      };
}
