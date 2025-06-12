class Data {
  Data({
      this.id, 
      this.fullName, 
      this.email, 
      this.age, 
      this.image, 
      this.gender, 
      this.role, 
      this.address, 
      this.birthDay,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    age = json['age'];
    image = json['image'];
    gender = json['gender'];
    role = json['role'];
    address = json['address'];
    birthDay = json['birthDay'];
  }
  String? id;
  String? fullName;
  String? email;
  num? age;
  dynamic image;
  String? gender;
  String? role;
  String? address;
  String? birthDay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fullName'] = fullName;
    map['email'] = email;
    map['age'] = age;
    map['image'] = image;
    map['gender'] = gender;
    map['role'] = role;
    map['address'] = address;
    map['birthDay'] = birthDay;
    return map;
  }

}