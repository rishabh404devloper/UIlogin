import 'package:cached_network_image/cached_network_image.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: 'https://via.placeholder.com/150', // Placeholder image URL
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(height: 16),
              Text(
                newsSource.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                newsSource.description,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 8),
              Text(
                'Category: ${newsSource.category}',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 8),
              Text(
                'Language: ${newsSource.language}',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 8),
              Text(
                'Country: ${newsSource.country}',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 8),
              Text(
                'URL: ${newsSource.url}',
                style: TextStyle(fontSize: 14, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
