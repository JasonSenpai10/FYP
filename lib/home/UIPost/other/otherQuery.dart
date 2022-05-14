import 'dart:convert';

class OtherQuery {
  String otherquery;
  String id;
  OtherQuery({required this.otherquery, required this.id});

  List<OtherQuery> modelQueryFromJson(String str) =>
      List<OtherQuery>.from(json.decode(str).map((x) => OtherQuery.fromJson(x)));

  String modelQueryToJson(List<OtherQuery> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory OtherQuery.fromJson(Map<dynamic, dynamic> json) {
    return OtherQuery(otherquery: json['queries'], id: json['id']);
  }
  Map<String, dynamic> toJson() => {
        "query": otherquery,
      };
}
