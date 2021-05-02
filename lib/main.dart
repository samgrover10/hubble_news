import 'package:flutter/material.dart';
import 'package:hubble_news/helpers/news_data.dart';
import 'package:hubble_news/pages/news_list.dart';
import 'package:hubble_news/pages/news_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: ChangeNotifierProvider(
          create: (context) => NewsData(),
          child: NewsList(),
        ),routes: {NewsView.route : (_)=>NewsView()},);
  }
}
