// a private class to show detailed news in a web view.
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class NewsDetailPage extends StatelessWidget {
  final String urlString;
  final String title;

  const NewsDetailPage({
    super.key,
    required this.urlString,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..loadRequest(
            Uri.parse(urlString),
          ),
      ),
    );
  }
}
