import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_app/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buidAppBar(),
      body: _buildBody(),
    );
  }

  _buidAppBar() {
    return AppBar(
      title: Text(
        "Daily News",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticleLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state is RemoteArticleError) {
        return const Center(child: Icon(Icons.refresh));
      }
      if (state is RemoteArticleDone) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ArticleWidget(
              article: state.articles![index],
            );
          },
          itemCount: state.articles!.length,
        );
      }

      return const SizedBox();
    });
  }
}
