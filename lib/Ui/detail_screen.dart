import 'package:flutter/material.dart';
import '../model/news_source.dart';

class DetailScreen extends StatelessWidget {
  final NewsSource newsSource;

  DetailScreen({required this.newsSource});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsSource.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://via.placeholder.com/150', // Placeholder image URL
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              newsSource.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(newsSource.description),
            SizedBox(height: 8),
            Text('Category: ${newsSource.category}'),
            SizedBox(height: 8),
            Text('Language: ${newsSource.language}'),
            SizedBox(height: 8),
            Text('Country: ${newsSource.country}'),
            SizedBox(height: 8),
            Text('URL: ${newsSource.url}'),
          ],
        ),
      ),
    );
  }
}
