class NewsSource {
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  NewsSource({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  factory NewsSource.fromJson(Map<String, dynamic> json) {
    return NewsSource(
      id: json['id'] ?? 'N/A',
      name: json['name'] ?? 'N/A',
      description: json['description'] ?? 'N/A',
      url: json['url'] ?? 'N/A',
      category: json['category'] ?? 'N/A',
      language: json['language'] ?? 'N/A',
      country: json['country'] ?? 'N/A',
    );
  }
}
