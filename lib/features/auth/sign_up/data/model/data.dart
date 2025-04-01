class Data {
  Data({
      this.email, 
      this.token,});

  Data.fromJson(dynamic json) {
    email = json['email'];
    token = json['token'];
  }
  String? email;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['token'] = token;
    return map;
  }

}