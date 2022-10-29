import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';

class NewsDetails extends StatelessWidget {
  final Articles data;
  const NewsDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Detail")),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(data.title ?? 'No title'),
      ]),
    );
  }
}
