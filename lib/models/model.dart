import 'package:best_design/models/source_model.dart';

class NewsModel {
  String? author, title, description, urlToImage, publishedAt, content;
  Source? source;
  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.source,
  });
  NewsModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
    source = Source.fromJson(json['source']);
  }
  toJson() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
      'source': source!.toJson(),
    };
  }
}
