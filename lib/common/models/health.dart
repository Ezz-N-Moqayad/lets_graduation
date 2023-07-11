class Health {
  late int id;
  late String name;
  late String image;
  late String desc;
  late String createdAt;
  late String updatedAt;
  late List<Meals> meals;

  Health.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    desc = json['desc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['meals'] != null) {
      meals = <Meals>[];
      json['meals'].forEach((v) {
        meals.add(Meals.fromJson(v));
      });
    }
  }
}

class Meals {
  late int id;
  late int foodId;
  late String name;
  late String image;
  late String desc;

  Meals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodId = json['food_id'];
    name = json['name'];
    image = json['image'];
    desc = json['desc'];
  }
}
