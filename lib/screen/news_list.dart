import 'package:flutter/material.dart';
import 'package:news_app/api/api.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/screen/news_detail.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<NewsInfo>(
        future: fetchNewsInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final list = snapshot.data!.articles;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetails(data: list[index]),
                      ));
                },
                child: Card(
                  child: Text('${list[index].title}'),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
