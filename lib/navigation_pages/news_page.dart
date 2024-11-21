
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MaterialApp(
    home: ArticleListScreen(),
  ));
}

class ArticleListScreen extends StatefulWidget {
  @override
  _ArticleListScreenState createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  late Future<List<Article>> articles;

  @override
  void initState() {
    super.initState();
    articles = ApiService().fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white38,
        title: const Text(
          'الأخبار',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<List<Article>>(
        future: articles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('خطأ: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('لا توجد مقالات.'));
          }

          final articlesList = snapshot.data!;

          return ListView.builder(
            itemCount: articlesList.length,
            itemBuilder: (context, index) {
              final article = articlesList[index];
              return Column(
                children: [
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: article.urlToImage != null
                        ? Image.network(
                      article.urlToImage!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                        : SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Container(color: Colors.grey), // Placeholder
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.description,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10), // Space between articles
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class ApiService {
  final Dio _dio = Dio();

  Future<List<Article>> fetchArticles() async {
    try {
      final response = await _dio.get('https://newsapi.org/v2/top-headlines?category=business&apiKey=977fe353ed5d4c9b84157084254c4de6');
      List<Article> articles = (response.data['articles'] as List)
          .map((articleJson) => Article.fromJson(articleJson))
          .toList();
      return articles;
    } catch (e) {
      print('خطأ في جلب المقالات: $e');
      return [];
    }
  }
}




class Article {
  final String title;
  final String description;
  final String? urlToImage;

  Article({required this.title, required this.description, this.urlToImage});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'] ?? 'لا توجد تفاصيل متاحة',
      urlToImage: json['urlToImage'],
    );
  }
}

