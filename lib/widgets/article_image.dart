import 'dart:math';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:z_news_feed/Modules/news_list/news_model.dart';

class ArticleImage extends StatelessWidget {
  final News? article;

  // ignore: use_key_in_widget_constructors
  const ArticleImage({this.article});

  @override
  Widget build(BuildContext context) {
    if (article!.thumbnailUrl != null) {
      return Hero(
        tag: article?.title ?? '',
        child: Container(
          constraints: const BoxConstraints(minHeight: 180),
          child: FadeInImage.memoryNetwork(
            fadeInDuration: const Duration(milliseconds: 100),
            placeholder: kTransparentImage,
            image: article!.thumbnailUrl!,
          ),
        ),
      );
    }

    return Container(
      height: 250,
      decoration: BoxDecoration(color: Colors.black.withOpacity(.8)),
    );
  }
}
