// ignore_for_file: empty_constructor_bodies

import 'package:floor/floor.dart';
import 'package:flutter_app/core/constants/constants.dart';
import 'package:flutter_app/features/daily_news/domain/entities/article.dart';

@Entity(tableName: "article", primaryKeys: [""])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          id: id,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
        author: map["author"] ?? "",
        title: map["title"] ?? "",
        description: map["description"] ?? "",
        url: map["url"] ?? "",
        urlToImage: map['urlToImage'] != null && map['urlToImage'] != ""
            ? map['urlToImage']
            : kDefaultImage,
        publishedAt: map["publishedAt"] ?? "",
        content: map["content"] ?? "");
  }
}
