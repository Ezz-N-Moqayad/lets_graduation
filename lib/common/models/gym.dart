class Gym {
  late int id;
  late String name;
  late String image;
  late String desc;
  late String location;
  late String createdAt;
  late String updatedAt;
  // late List<Prices> prices;

  Gym.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    desc = json['desc'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // if (json['prices'] != null) {
    //   prices = <Prices>[];
    //   json['prices'].forEach((v) {
    //     prices.add(Prices.fromJson(v));
    //   });
    // }
  }
}

class Prices {
  late int id;
  late int gymId;
  late String name;
  late String image;
  late String price;
  late String desc;
  late String createdAt;
  late String updatedAt;

  Prices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gymId = json['gym_id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    desc = json['desc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
