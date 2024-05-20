import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
  bool isLoading = false; // Track loading state

  @override
  void initState() {
    super.initState();
    isLoading = true; // Set loading state to true when data fetching starts
    futureNewsSources = ApiService().fetchNewsSources().whenComplete(() {
      setState(() {
        isLoading = false; // Set loading state to false when data fetching completes
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Sources'),
      ),
      body: Stack(
        children: [
          FutureBuilder<List<NewsSource>>(
            future: futureNewsSources,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print('Error: ${snapshot.error}');
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15.0),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(newsSource: newsSource),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: 'https://via.placeholder.com/150', // Placeholder image URL
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    newsSource.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    newsSource.description,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
          // Loading indicator
          Visibility(
            visible: isLoading, // Show the loading indicator if isLoading is true
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
