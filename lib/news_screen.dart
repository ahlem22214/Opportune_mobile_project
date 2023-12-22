import 'package:flutter/material.dart';
import 'news_service.dart';

class NewsScreen extends StatelessWidget {
  final NewsService newsService = NewsService('c6de117744254a96b36f3b0ce19e3490');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: FutureBuilder(
        future: newsService.getTopHeadlines(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<Article> articles = snapshot.data as List<Article>;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(articles[index].title),
                  subtitle: Text(articles[index].description),
                  onTap: () {
                    // Open the article URL in a webview or navigate to a detailed view
                    print('Open URL: ${articles[index].url}');
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
