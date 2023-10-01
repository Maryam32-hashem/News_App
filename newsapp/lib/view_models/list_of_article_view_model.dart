 import 'package:flutter/cupertino.dart';
import 'package:newsapp/serviece/news_serviece.dart';

import '../models/article_model.dart';

class ArticlesListViewModel extends ChangeNotifier{
  List<Article> _articleList =[];
  List<Article> _articleListByCategory =[];

  Future <void> fetchArticles ()async{
_articleList = await NewsApp().fetchData();
notifyListeners();
  }
  Future<void>fetchArticlesByCategory (String category)async{
    _articleListByCategory = await NewsApp().fetchDataByCategory(category);
    notifyListeners();
  }
  List<Article> get articleList => _articleList;
  List<Article> get articleListByCategory => _articleListByCategory;

}