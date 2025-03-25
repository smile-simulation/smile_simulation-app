import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? id;
  final String? fullName;
  final String? email;
  final String? image;
  final String? gender;
  final int? experience;
  final String? qualification;
  final String? specialization;
  final String? role;
  final dynamic address;
  final dynamic birthDay;

  const Data({
    this.id,
    this.fullName,
    this.email,
    this.image,
    this.gender,
    this.experience,
    this.qualification,
    this.specialization,
    this.role,
    this.address,
    this.birthDay,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'] as String?,
    fullName: json['fullName'] as String?,
    email: json['email'] as String?,
    image: json['image'] as String?,
    gender: json['gender'] as String?,
    experience: json['experience'] as int?,
    qualification: json['qualification'] as String?,
    specialization: json['specialization'] as String?,
    role: json['role'] as String?,
    address: json['address'] as dynamic,
    birthDay: json['birthDay'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullName': fullName,
    'email': email,
    'image': image,
    'gender': gender,
    'experience': experience,
    'qualification': qualification,
    'specialization': specialization,
    'role': role,
    'address': address,
    'birthDay': birthDay,
  };

  @override
  List<Object?> get props {
    return [
      id,
      fullName,
      email,
      image,
      gender,
      experience,
      qualification,
      specialization,
      role,
      address,
      birthDay,
    ];
  }
}
