// serviece class to fetch the data
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:newsapp/models/articles_model.dart';

import '../models/article_model.dart';
class NewsApp{
/*Future<List<Article>> fetchArticles ()async{
  //to get the response of the selected url
 try {
  http.Response response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=eg&apiKey=bdc4b9cf3df1423e8fea3db43f94ddd3'));
  if(response.statusCode==200){
   String data = response.body;
   var jsonData = jsonDecode(data);
   Articles articles = Articles(articles: jsonData[0]);
 List<Article> articleData= articles.articles.map((e) => Article.fromJson(e)).toList();

 return articleData;
   
  }
  else{
   //print('statues code =${response.statusCode}');
   throw Exception("statues code: ${response.statusCode}");
  }
 }catch(ex){
  throw Exception(ex);

 }*/
Future<List<Article>> fetchData()async{
 final http.Response response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=bdc4b9cf3df1423e8fea3db43f94ddd3'));
if (response.statusCode==200)
  {String data = response.body;
  var jsonData = jsonDecode(data);
  Articles articles = Articles(articles: jsonData[0]);
  List<Article> articleData= articles.articles.map((e) => Article.fromJson(e)).toList();
  return articleData;}
else {
 throw Exception("statues code :${response.statusCode}");
}


}
Future<List<Article>> fetchDataByCategory(String category)async{
 final http.Response response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=bdc4b9cf3df1423e8fea3db43f94ddd3'));
 if (response.statusCode==200)
 {String data = response.body;
 var jsonData = jsonDecode(data);
 Articles articles = Articles(articles: jsonData[0]);
 List<Article> articleData= articles.articles.map((e) => Article.fromJson(e)).toList();
 return articleData;}
 else {
  throw Exception("statues code :${response.statusCode}");
 }


}

}
/*Future<List <Article>> fetchData()async{
 try{
 http.Response response =await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=bdc4b9cf3df1423e8fea3db43f94ddd3'));
 List <Article>newsData =[];
     return newsData;}catch(e){
  print(e);
 }
}*/


