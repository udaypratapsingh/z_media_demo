
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:z_news_feed/Modules/news_list/news_bloc.dart';
import 'package:z_news_feed/bloc/bloc_builder.dart';
import 'package:z_news_feed/constants/app_constant.dart';
import 'package:z_news_feed/utils/app_routes.dart';
import 'package:z_news_feed/utils/app_theme.dart';
import 'package:z_news_feed/widgets/news_list_tile.dart';

const screenTitle = 'News Feed';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  final GlobalKey<ScaffoldState> _offloadKey = GlobalKey<ScaffoldState>();
  final NewsBloc _bloc = NewsBloc();
  @override
  void initState() {
    super.initState();
    _bloc.getNewsfeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _offloadKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          screenTitle,
          style: AppTheme.screentitle,
        ),
        backgroundColor: Colors.green ,
      ),
      body: BlocBuilder(
          bloc: _bloc,
          builder: () {
            return Center(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount:_bloc.state.model!= null ?  _bloc.state.model!.news!.length : 0,
            itemBuilder: (context, index) {

              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.newsDetails, arguments:_bloc.state.model!.news![index]);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: padding_10, vertical: padding_5),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3), blurRadius: 1)
                    ]),
                    child: NewsListTile(
                        article: _bloc.state.model!.news![index], color: index % 2 == 0 ?  Colors.indigoAccent : Colors.green),
                  ),
                ),
              );
            },
          )
            );
          }),
    );
  }
}

