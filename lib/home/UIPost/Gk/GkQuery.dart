import 'dart:convert';

class GkQuery {
  String gkquery;
  String id;
  GkQuery({required this.gkquery, required this.id});

  List<GkQuery> modelQueryFromJson(String str) =>
      List<GkQuery>.from(json.decode(str).map((x) => GkQuery.fromJson(x)));

  String modelQueryToJson(List<GkQuery> data) =>
      json.encode(List<dynamic>. from(data.map((x) => x.toJson())));

  factory GkQuery.fromJson(Map<dynamic, dynamic> json) {
    return GkQuery(gkquery: json['queries'], id: json['id']);
  }
  Map<String, dynamic> toJson() => {
        "query": gkquery,
      };
}
