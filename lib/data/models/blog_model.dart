class BlogModel {
  final int id;
  final String title;
  final String category;
  final double review;
  final String description;
  final String image;

  BlogModel({
    required this.id,
    required this.title,
    required this.category,
    required this.review,
    required this.description,
    required this.image,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      review: json['review'].toDouble(),
      description: json['description'],
      image: json['image'],
    );
  }
}
