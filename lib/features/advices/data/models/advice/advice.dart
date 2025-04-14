import 'package:equatable/equatable.dart';

class Advice extends Equatable {
  final int? id;
  final String? image;
  final String? title;
  final String? description;
  final dynamic link;
  final dynamic descriptionOfLink;
  final int? categoryId;
  final String? category;

  const Advice({
    this.id,
    this.image,
    this.title,
    this.description,
    this.link,
    this.descriptionOfLink,
    this.categoryId,
    this.category,
  });

  factory Advice.fromJson(Map<String, dynamic> json) => Advice(
    id: json['id'] as int?,
    image: json['image'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    link: json['link'] as dynamic,
    descriptionOfLink: json['descriptionOfLink'] as dynamic,
    categoryId: json['categoryId'] as int?,
    category: json['category'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,
    'title': title,
    'description': description,
    'link': link,
    'descriptionOfLink': descriptionOfLink,
    'categoryId': categoryId,
    'category': category,
  };

  @override
  List<Object?> get props {
    return [
      id,
      image,
      title,
      description,
      link,
      descriptionOfLink,
      categoryId,
      category,
    ];
  }
}
