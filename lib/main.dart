import 'package:flutter/material.dart';
import 'package:flutter_app/config/theme/app_themes.dart';
import 'package:flutter_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_app/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
        create: (context) => sl()..add(const GetArticle()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: const DailyNews(),
        ));
  }
}
