import 'dart:convert';

class HealthQuery {
  String healthquery;
  String id;
  HealthQuery({required this.healthquery, required this.id});

  List<HealthQuery> modelQueryFromJson(String str) =>
      List<HealthQuery>.from(json.decode(str).map((x) => HealthQuery.fromJson(x)));

  String modelQueryToJson(List<HealthQuery> data) =>
      json.encode(List<dynamic>. from(data.map((x) => x.toJson())));

  factory HealthQuery.fromJson(Map<dynamic, dynamic> json) {
    return HealthQuery(healthquery: json['queries'], id: json['id']);
  }
  Map<String, dynamic> toJson() => {
        "query": healthquery,
      };
}
