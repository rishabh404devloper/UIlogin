import 'package:flutter/material.dart';

import '../model/news_source.dart';
import '../network/api_service.dart';
import 'detail_screen.dart';

class ListingScreen extends StatefulWidget {
  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  late Future<List<NewsSource>> futureNewsSources;

  @override
  void initState() {
    super.initState();
    futureNewsSources = ApiService().fetchNewsSources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Sources'),
      ),
      body: FutureBuilder<List<NewsSource>>(
        future: futureNewsSources,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news sources available'));
          } else {
            final newsSources = snapshot.data!;
            return ListView.builder(
              itemCount: newsSources.length,
              itemBuilder: (context, index) {
                final newsSource = newsSources[index];
                return Card(
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Image.network(
                      'https://via.placeholder.com/150', // Placeholder image URL
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(newsSource.name),
                    subtitle: Text(newsSource.description),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(newsSource: newsSource),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
