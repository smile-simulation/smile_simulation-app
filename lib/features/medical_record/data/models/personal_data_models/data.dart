class Data {
  Data({
    this.id,
    this.fullName,
    this.email,
    this.age,
    this.phoneNumber,
    this.gender,
    this.job,
    this.maritalStatus,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    age = json['age'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    job = json['job'];
    maritalStatus = json['maritalStatus'];
  }
  String? id;
  String? fullName;
  String? email;
  num? age;
  String? phoneNumber;
  String? gender;
  String? job;
  String? maritalStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fullName'] = fullName;
    map['email'] = email;
    map['age'] = age;
    map['phoneNumber'] = phoneNumber;
    map['gender'] = gender;
    map['job'] = job;
    map['maritalStatus'] = maritalStatus;
    return map;
  }
}
