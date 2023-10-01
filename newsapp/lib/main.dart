import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/serviece/news_serviece.dart';
import 'package:newsapp/view_models/list_of_article_view_model.dart';
import 'package:newsapp/views/home.dart';
import 'package:provider/provider.dart';

import 'models/articles_model.dart';
import 'package:http/http.dart'as http;

void main() {
  runApp(const MyCloud());
}

class MyCloud extends StatelessWidget {
  const MyCloud({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticlesListViewModel>(
      create: (context)=>ArticlesListViewModel(),
      child: MaterialApp(
        home: HomeView()
      ),
    );
  }
}
