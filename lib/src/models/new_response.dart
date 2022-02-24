// To parse this JSON data, do
//
//     final newResponse = newResponseFromJson(jsonString);

import 'dart:convert';

import 'package:appicacion_noticias/src/models/models.dart';

NewResponse newResponseFromJson(String str) =>
    NewResponse.fromJson(json.decode(str));

String newResponseToJson(NewResponse data) => json.encode(data.toJson());

// To parse this JSON data, do
//
//     final newResponse = newResponseFromMap(jsonString);

class NewResponse {
  NewResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<Article>? articles;

  factory NewResponse.fromJson(String str) =>
      NewResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewResponse.fromMap(Map<String, dynamic> json) => NewResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles:
            List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toMap())),
      };
}
