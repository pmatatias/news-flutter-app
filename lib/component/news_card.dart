import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/utils/helper.dart';

class NewsCard extends StatelessWidget {
  final Articles data;
  final VoidCallback? onTap;
  const NewsCard({super.key, this.onTap, required this.data});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: Colors.grey.shade200,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  top: 0,
                  width: 60,
                  child: Container(
                    decoration: BoxDecoration(
                        // color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network('${data.urlToImage}').image)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(63, 2, 8, 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          momentTime(data.publishedAt),
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          data.title ?? 'No Title',
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
