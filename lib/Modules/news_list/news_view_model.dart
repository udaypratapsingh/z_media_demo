



import 'package:z_news_feed/Modules/news_list/news_model.dart';

class NewsViewModel {
   late NewsState state;
   late  NewsModel? model;
   NewsViewModel(this.state, this.model);
}


enum NewsState {
  none,
  loading,
  success,
  error,
}