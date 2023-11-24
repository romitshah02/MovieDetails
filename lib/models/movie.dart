// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Movie {
  final int id;
  final String name;
  final String type;
  final String language;
  final int? runtime;
  final String image;
  final String summary;
  final num? rating;

  Movie(
      {required this.id,
      required this.name,
      required this.type,
      required this.language,
      required this.runtime,
      required this.image,
      this.rating,
      required this.summary});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'language': language,
      'runtime': runtime,
      'image': image,
      'summary': summary,
      'rating': rating,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      name: map['name'] as String,
      type: map['type'] as String,
      language: map['language'] as String,
      runtime: map['runtime'] != null ? map['runtime'] as int : null,
      image: map['image']['original'] as String,
      summary: map['summary'] as String,
      rating: map['rating']['average'] != null
          ? map['rating']['average'] as num
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
