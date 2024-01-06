import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String imageUrl; // Make imageUrl nullable
  final String content;


  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.content,
  });
}


class NewsService {
  final String apiKey;

  NewsService(this.apiKey);

  Future<List<NewsArticle>> getNews() async {
    final response = await http.get(
      Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=c6de117744254a96b36f3b0ce19e3490'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 'ok') {
        return (data['articles'] as List)
            .map((article) => NewsArticle(
          title: article['title'] ?? '', // Handle null for title
          description: article['description'] ?? '', // Handle null for description
          url: article['url'] ?? '', // Handle null for url
          imageUrl: article['urlToImage'] ?? '', // Handle null for imageUrl
          content: article['content'] ?? '', // Make sure content is not null
        ))
            .toList();

      } else {
        throw Exception('Failed to load news');
      }
    } else {
      throw Exception('Failed to load news');
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: NewsScreen(),
    );
  }
}

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final String apiKey = 'c6de117744254a96b36f3b0ce19e3490';
  late NewsService newsService;
  late List<NewsArticle> news = []; // Initialize the list

  @override
  void initState() {
    super.initState();
    newsService = NewsService(apiKey);
    loadNews();
  }

  void loadNews() async {
    try {
      List<NewsArticle> loadedNews = await newsService.getNews();
      setState(() {
        news = loadedNews;
      });
    } catch (e) {
      print('Error loading news: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          final article = news[index];
          return ListTile(
            title: Text(article.title),
            subtitle: Text(article.description),
            leading: CachedNetworkImage(
              imageUrl: article.imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailsScreen(article: article),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ArticleDetailsScreen extends StatelessWidget {
  final NewsArticle article;

  const ArticleDetailsScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: article.imageUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(height: 16),
              Text(
                article.content,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



