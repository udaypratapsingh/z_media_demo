import 'package:flutter/foundation.dart';
import 'package:z_news_feed/Modules/news_list/news_model.dart';
import 'package:z_news_feed/Modules/news_list/news_view_model.dart';
import 'package:z_news_feed/bloc/bloc.dart';
import 'package:dio/dio.dart';

class NewsBloc extends Bloc<NewsViewModel> {
  @override
  initDefaultValue() {
    return NewsViewModel(NewsState.loading, null);
  }

  void getNewsfeed() async {
    try {
      var response = await Dio().get('https://jsonkeeper.com/b/0Y0J');
      if (kDebugMode) {
        print(response);
      }
     NewsModel model =  NewsModel.fromJson(response.data);
     emit(NewsViewModel(NewsState.success, model));
    
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(NewsViewModel(NewsState.error, null));
    }
  }
}
