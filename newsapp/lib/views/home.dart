import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/view_models/list_of_article_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            await Provider.of<ArticlesListViewModel>(context,listen: false).fetchArticles();
            print(Provider.of<ArticlesListViewModel>(context,listen: false).articleList);
          },
          child: Text("fetch data"),
        ),
      ),
    );
  }
}
