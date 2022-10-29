import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class NewsInfo {
  String? status;
  int? totalResults;
  List<Articles> articles = [];

  NewsInfo({required this.articles, this.status, this.totalResults});

  factory NewsInfo.fromJson(Map<String, dynamic> json) =>
      _$NewsInfoFromJson(json);
  Map<String, dynamic> toJson() => _$NewsInfoToJson(this);
}

@JsonSerializable()
class Articles {
  Source? source;
  String? author, title, description, url, urlToImage, publishedAt, content;

  Articles(
      {this.author,
      this.content,
      this.description,
      this.publishedAt,
      this.source,
      this.title,
      this.url,
      this.urlToImage});
  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}

@JsonSerializable()
class Source {
  String? id;
  String? name;

  Source({this.id, this.name});
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
