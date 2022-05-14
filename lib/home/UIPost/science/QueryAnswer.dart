import 'dart:convert';

class QueryAnswer {
  String answer;
  String qid;
  QueryAnswer({required this.answer, required this.qid});

  List<QueryAnswer> modelQueryFromJson(String str) =>
      List<QueryAnswer>.from(json.decode(str).map((x) => QueryAnswer.fromJson(x)));

  String modelQueryToJson(List<QueryAnswer> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory QueryAnswer.fromJson(Map<dynamic, dynamic> json) {
    return QueryAnswer(answer: json['answer'], qid: json['qid']);
  }
  Map<String, dynamic> toJson() => {
        "answer": answer,
      };
}
