import 'package:flutter/foundation.dart';

class Article {
  final String title;
  final String subTitle;
   final String url;
  final String urlImage;
  //constractor
Article({
    required this.title,
  required this.subTitle,
  required this.url,
  required this.urlImage
});
//factory constractor is a constractor to assign the attributes of the class with json data
factory Article.fromJson(Map<String ,dynamic> jsonData){
  return Article(title: jsonData['title'],
      subTitle:jsonData['description'],
      url: jsonData['url'],
      urlImage: jsonData['urlToImage']);

}

}