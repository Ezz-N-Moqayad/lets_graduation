import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  late String? id;
  late String? accessToken;
  late String? name;
  late String? email;
  late String? password;
  late String? photourl;
  late String? widthKg;
  late String? heightCm;
  late String? location;
  late String? gender;
  late String? fcmtoken;
  late Timestamp? addtime;

  UserData({
    this.id,
    this.accessToken,
    this.name,
    this.email,
    this.password,
    this.photourl,
    this.widthKg,
    this.heightCm,
    this.location,
    this.gender,
    this.fcmtoken,
    this.addtime,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accessToken = json['accessToken'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    photourl = json['photourl'];
    widthKg = json['widthKg'];
    heightCm = json['heightCm'];
    location = json['location'];
    gender = json['gender'];
    fcmtoken = json['fcmtoken'];
    addtime = json['addtime'];
  }

  factory UserData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserData(
      id: data?['id'],
      accessToken: data?['accessToken'],
      name: data?['name'],
      email: data?['email'],
      password: data?['password'],
      photourl: data?['photourl'],
      widthKg: data?['widthKg'],
      heightCm: data?['heightCm'],
      location: data?['location'],
      gender: data?['gender'],
      fcmtoken: data?['fcmtoken'],
      addtime: data?['addtime'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (accessToken != null) "accessToken": accessToken,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (password != null) "password": password,
      if (photourl != null) "photourl": photourl,
      if (widthKg != null) "widthKg": widthKg,
      if (heightCm != null) "heightCm": heightCm,
      if (location != null) "location": location,
      if (gender != null) "gender": gender,
      if (fcmtoken != null) "fcmtoken": fcmtoken,
      if (addtime != null) "addtime": addtime,
    };
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "accessToken": accessToken,
        "name": name,
        "email": email,
        "password": password,
        "photourl": photourl,
        "widthKg": widthKg,
        "heightCm": heightCm,
        "location": location,
        "gender": gender,
        "fcmtoken": fcmtoken,
      };
}

enum Gender { male, female, non }
