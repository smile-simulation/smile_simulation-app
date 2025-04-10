import 'package:equatable/equatable.dart';

class AdvicesCategory extends Equatable {
  final int? id;
  final String? name;
  final String? image;

  const AdvicesCategory({this.id, this.name, this.image});

  factory AdvicesCategory.fromJson(Map<String, dynamic> json) {
    return AdvicesCategory(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'image': image};

  @override
  List<Object?> get props => [id, name, image];
}
