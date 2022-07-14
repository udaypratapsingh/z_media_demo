// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:z_news_feed/Modules/news_list/news_model.dart';
import 'package:z_news_feed/utils/app_theme.dart';
import 'package:z_news_feed/widgets/article_image.dart';


const screenTitle = 'News Detail';

class NewsDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)?.settings.arguments as News ;
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: const Text(
          screenTitle,
          style: AppTheme.screentitle,
        ),
        backgroundColor: Colors.green ,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ArticleImage(article: article),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
              decoration: const  BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    article.summary ?? '',
                    style: AppTheme.smallTitle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    article.title ?? '',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    article.section ?? '',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 14.0),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    article.highlights ?? '',
                    style:const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
