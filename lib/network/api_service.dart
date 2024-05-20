import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/news_source.dart';

class ApiService {
  static const String apiUrl = 'https://newsapi.org/v2/top-headlines/sources?apiKey=0212654eba504313abd881247237d188';

  Future<List<NewsSource>> fetchNewsSources() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['sources'];
        return data.map((json) => NewsSource.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load news sources');
      }
    } catch (e) {
      print('Error fetching news sources: $e');
      throw Exception('Error fetching news sources: $e');
    }
  }
}
