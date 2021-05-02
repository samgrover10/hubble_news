import 'package:flutter/material.dart';
import 'package:hubble_news/helpers/news_data.dart';
import 'package:hubble_news/widgets/news_item.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsData>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hubble',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              Text(
                'News',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        body: FutureBuilder(
          future: newsData.getAndSetNews(),
          builder: (ctx, snap) {
            if (snap.connectionState == ConnectionState.done) {
              if (snap.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'Error',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              } else {
                return Consumer<NewsData>(builder: (_, newsData, __) {
                  return ListView.builder(itemBuilder: (_, i) {
                    final newsItems = newsData.items;
                    return NewsItem(
                      title: newsItems[i].name,
                      url: newsItems[i].url,
                    );
                  },itemCount: newsData.items.length,);
                });
              }
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
