class Data {
  Data({
      this.userId, 
      this.fullName, 
      this.userName, 
      this.email, 
      this.image, 
      this.gender, 
      this.role, 
      this.birthDay, 
      this.address, 
      this.phoneNumber, 
      this.age, 
      this.isSmoker, 
      this.jop, 
      this.maritalStatus, 
      this.chronicDiseases, 
      this.drugAllergy, 
      this.hasSurgicalCurrency, 
      this.familyMedicalHistory, 
      this.pregnancyAndBreastfeeding, 
      this.hasHypertension, 
      this.hasDiabetes, 
      this.hasHeartDisease, 
      this.hasLiverDisease, 
      this.hasKidneyDisease, 
      this.hasAnemia, 
      this.hasThyroidDisease, 
      this.hasHepatitis, 
      this.otherChronicDiseasesDescription, 
      this.qualification, 
      this.specialization, 
      this.experience, 
      this.token,});

  Data.fromJson(dynamic json) {
    userId = json['userId'];
    fullName = json['fullName'];
    userName = json['userName'];
    email = json['email'];
    image = json['image'];
    gender = json['gender'];
    role = json['role'];
    birthDay = json['birthDay'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    age = json['age'];
    isSmoker = json['isSmoker'];
    jop = json['jop'];
    maritalStatus = json['maritalStatus'];
    chronicDiseases = json['chronic_diseases'];
    drugAllergy = json['drug_Allergy'];
    hasSurgicalCurrency = json['has_Surgical_Currency'];
    familyMedicalHistory = json['familyMedicalHistory'];
    pregnancyAndBreastfeeding = json['pregnancyAndBreastfeeding'];
    hasHypertension = json['hasHypertension'];
    hasDiabetes = json['hasDiabetes'];
    hasHeartDisease = json['hasHeartDisease'];
    hasLiverDisease = json['hasLiverDisease'];
    hasKidneyDisease = json['hasKidneyDisease'];
    hasAnemia = json['hasAnemia'];
    hasThyroidDisease = json['hasThyroidDisease'];
    hasHepatitis = json['hasHepatitis'];
    otherChronicDiseasesDescription = json['otherChronicDiseasesDescription'];
    qualification = json['qualification'];
    specialization = json['specialization'];
    experience = json['experience'];
    token = json['token'];
  }
  String? userId;
  String? fullName;
  String? userName;
  String? email;
  dynamic image;
  String? gender;
  String? role;
  dynamic birthDay;
  String? address;
  String? phoneNumber;
  num? age;
  bool? isSmoker;
  String? jop;
  String? maritalStatus;
  dynamic chronicDiseases;
  String? drugAllergy;
  bool? hasSurgicalCurrency;
  bool? familyMedicalHistory;
  String? pregnancyAndBreastfeeding;
  bool? hasHypertension;
  bool? hasDiabetes;
  bool? hasHeartDisease;
  bool? hasLiverDisease;
  bool? hasKidneyDisease;
  bool? hasAnemia;
  bool? hasThyroidDisease;
  bool? hasHepatitis;
  String? otherChronicDiseasesDescription;
  dynamic qualification;
  dynamic specialization;
  dynamic experience;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['fullName'] = fullName;
    map['userName'] = userName;
    map['email'] = email;
    map['image'] = image;
    map['gender'] = gender;
    map['role'] = role;
    map['birthDay'] = birthDay;
    map['address'] = address;
    map['phoneNumber'] = phoneNumber;
    map['age'] = age;
    map['isSmoker'] = isSmoker;
    map['jop'] = jop;
    map['maritalStatus'] = maritalStatus;
    map['chronic_diseases'] = chronicDiseases;
    map['drug_Allergy'] = drugAllergy;
    map['has_Surgical_Currency'] = hasSurgicalCurrency;
    map['familyMedicalHistory'] = familyMedicalHistory;
    map['pregnancyAndBreastfeeding'] = pregnancyAndBreastfeeding;
    map['hasHypertension'] = hasHypertension;
    map['hasDiabetes'] = hasDiabetes;
    map['hasHeartDisease'] = hasHeartDisease;
    map['hasLiverDisease'] = hasLiverDisease;
    map['hasKidneyDisease'] = hasKidneyDisease;
    map['hasAnemia'] = hasAnemia;
    map['hasThyroidDisease'] = hasThyroidDisease;
    map['hasHepatitis'] = hasHepatitis;
    map['otherChronicDiseasesDescription'] = otherChronicDiseasesDescription;
    map['qualification'] = qualification;
    map['specialization'] = specialization;
    map['experience'] = experience;
    map['token'] = token;
    return map;
  }

}