import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsWeb extends StatelessWidget {
  final String url;
  const NewsWeb({super.key, this.url = ''});



  @override
  Widget build(BuildContext context) {
    final flutterWebviewPlugin = FlutterWebviewPlugin();
    flutterWebviewPlugin.launch(
      (url),
      rect: Rect.fromLTWH(
        0.0,
        0.0,
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height - (AppBar().preferredSize.height),
      ),
    );
    return SafeArea(
      child: WebviewScaffold(
        url: url,
        appBar: AppBar(
          title: const Text('News'),
        ),
      ),
    );
  }
}
