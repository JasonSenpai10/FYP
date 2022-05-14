import 'dart:convert';

class NepQuery {
  String nepquery;
  String id;
  NepQuery({required this.nepquery, required this.id});

  List<NepQuery> modelQueryFromJson(String str) =>
      List<NepQuery>.from(json.decode(str).map((x) => NepQuery.fromJson(x)));

  String modelQueryToJson(List<NepQuery> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory NepQuery.fromJson(Map<dynamic, dynamic> json) {
    return NepQuery(nepquery: json['queries'], id: json['id']);
  }
  Map<String, dynamic> toJson() => {
        "query": nepquery,
      };
}
