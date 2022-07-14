

import 'package:flutter/cupertino.dart';
import 'package:z_news_feed/Modules/news_detail/news_detail.dart';
import 'package:z_news_feed/Modules/news_list/news_feed.dart';



class AppRoutes {
  // Route name constants
  static const String newsFeed = '/newsFeed';
  static const String newsDetails = '/newsDetail';


  /// The map used to define our routes, needs to be supplied to [MaterialApp]
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      newsFeed: (context) => const NewsFeed(),
      newsDetails: (context) => NewsDetailPage(),
    };
  }
}
