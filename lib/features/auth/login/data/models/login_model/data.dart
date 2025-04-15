class Data {
  Data({
      this.userId, 
      this.fullName, 
      this.email, 
      this.image, 
      this.gender, 
      this.token,});

  Data.fromJson(dynamic json) {
    userId = json['userId'];
    fullName = json['fullName'];
    email = json['email'];
    image = json['image'];
    gender = json['gender'];
    token = json['token'];
  }
  String? userId;
  String? fullName;
  String? email;
  dynamic image;
  String? gender;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['fullName'] = fullName;
    map['email'] = email;
    map['image'] = image;
    map['gender'] = gender;
    map['token'] = token;
    return map;
  }

}