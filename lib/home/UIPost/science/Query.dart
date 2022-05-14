import 'dart:convert';

class Query {
  String query;
  String id;
  Query({required this.query, required this.id});

  List<Query> modelQueryFromJson(String str) =>
      List<Query>.from(json.decode(str).map((x) => Query.fromJson(x)));

  String modelQueryToJson(List<Query> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory Query.fromJson(Map<dynamic, dynamic> json) {
    return Query(query: json['queries'], id: json['id']);
  }
  Map<String, dynamic> toJson() => {
        "query": query,
      };
}
