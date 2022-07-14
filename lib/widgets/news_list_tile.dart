


// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:z_news_feed/Modules/news_list/news_model.dart';
import 'package:z_news_feed/constants/app_constant.dart';
import 'package:z_news_feed/utils/app_theme.dart';
import 'package:z_news_feed/widgets/article_image.dart';

class NewsListTile extends StatefulWidget {
  final News? article;
  final Color? color;

   const NewsListTile({this.article, this.color = Colors.indigoAccent});

  @override
  _NewsListTileState createState() => _NewsListTileState();
}

class _NewsListTileState extends State<NewsListTile>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Stack(
          fit: StackFit.loose,
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            AnimatedSize(
              // ignore: deprecated_member_use
              vsync: this,
              duration: const Duration(milliseconds: 300),
              child: ArticleImage(article: widget.article),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: padding_5, horizontal: padding_5),
                padding:  const EdgeInsets.symmetric(vertical:padding_5, horizontal: padding_10),
                decoration: BoxDecoration(
                  color: widget.color!.withOpacity(.8),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(
                  widget.article?.section ?? '',
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  style: AppTheme.smallTitle.copyWith(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.symmetric(vertical: padding_10, horizontal: padding_10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.article?.title ?? '',
                style: AppTheme.smallTitle,
              ),
              Text(widget.article?.slug ?? '',
                  style: AppTheme.smallTitle),
            ],
          ),
        )
      ],
    );
  }
}
