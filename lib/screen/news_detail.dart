import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/screen/news_web.dart';
import 'package:news_app/utils/helper.dart';

class NewsDetails extends StatelessWidget {
  final Articles data;
  const NewsDetails({super.key, required this.data});

  // Future<void> _launchUrl() async {
  //   final url = data.url ?? '';
  //   if (await canLaunch(url)) {
  //     await launch(url); //forceWebView is true now
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News Detail")),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.3),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.network('${data.urlToImage}'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                momentTime(data.publishedAt),
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                '${data.title}',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('authtor: ${data.author}'),
              const SizedBox(
                height: 4,
              ),
              Text('source: ${data.source?.name}'),
              const SizedBox(
                height: 8,
              ),
              Text(data.description ?? ''),
              const SizedBox(
                height: 8,
              ),
              Text(data.content ?? ''),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsWeb(url: data.url ?? ''),
                          ));
                    },
                    child: const Text('Readmore'),
                  )),
            ]),
          )
        ]),
      ),
    );
  }
}
