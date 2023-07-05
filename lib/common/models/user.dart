import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  late String? id;
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
    name = json['name'];
    email = json['email'];
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
}

class UserLoginResponseEntity {
  String? accessToken;
  String? displayName;
  String? email;
  String? password;
  String? photoUrl;

  UserLoginResponseEntity({
    this.accessToken,
    this.displayName,
    this.email,
    this.password,
    this.photoUrl,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        accessToken: json["access_token"],
        displayName: json["display_name"],
        email: json["email"],
        password: json["password"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "display_name": displayName,
        "email": email,
        "password": password,
        "photoUrl": photoUrl,
      };
}

class MeListItem {
  String? name;
  String? icon;
  String? explain;
  String? route;

  MeListItem({
    this.name,
    this.icon,
    this.explain,
    this.route,
  });

  factory MeListItem.fromJson(Map<String, dynamic> json) => MeListItem(
        name: json["name"],
        icon: json["icon"],
        explain: json["explain"],
        route: json["route"],
      );
}

enum Gender { male, female, non }
