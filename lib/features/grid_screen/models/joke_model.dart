final class JokeModel {
  final int id;
  final String text;
  final double rating;

  JokeModel({required this.id, required this.text, required this.rating});

  factory JokeModel.fromJson(Map<String, dynamic> json) =>
      JokeModel(id: json['id'], text: json['text'], rating: json['rating'] ?? 0.0);
}
