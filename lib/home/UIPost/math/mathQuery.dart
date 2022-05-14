import 'dart:convert';

class MathQuery {
  String mathquery;
  String id;
  MathQuery({required this.mathquery, required this.id});

  List<MathQuery> modelQueryFromJson(String str) =>
      List<MathQuery>.from(json.decode(str).map((x) => MathQuery.fromJson(x)));

  String modelQueryToJson(List<MathQuery> data) =>
      json.encode(List<dynamic>. from(data.map((x) => x.toJson())));

  factory MathQuery.fromJson(Map<dynamic, dynamic> json) {
    return MathQuery(mathquery: json['queries'], id: json['id']);
  }
  Map<String, dynamic> toJson() => {
        "query": mathquery,
      };
}
