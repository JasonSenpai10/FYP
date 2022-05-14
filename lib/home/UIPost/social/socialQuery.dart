import 'dart:convert';

class SocialQuery {
  String socialquery;
  String id;
  SocialQuery({required this.socialquery, required this.id});

  List<SocialQuery> modelQueryFromJson(String str) =>
      List<SocialQuery>.from(json.decode(str).map((x) => SocialQuery.fromJson(x)));

  String modelQueryToJson(List<SocialQuery> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory SocialQuery.fromJson(Map<dynamic, dynamic> json) {
    return SocialQuery(socialquery: json['queries'], id: json['id']);
  }
  Map<String, dynamic> toJson() => {
        "query": socialquery,
      };
}
