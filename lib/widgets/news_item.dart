import 'package:flutter/material.dart';
import 'package:hubble_news/pages/news_view.dart';

class NewsItem extends StatelessWidget {
  final String title;
  final String url;
  NewsItem({@required this.title, @required this.url});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            maxLines: 2,
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.arrow_forward_outlined,
              color: Colors.red,
            ),
            onPressed: () async {
              await Future.delayed(Duration(milliseconds: 200), () {
                Navigator.of(context).pushNamed(NewsView.route,arguments: url);
              });
            },
          ),
        ),
        Divider(),
      ],
    );
  }
}
