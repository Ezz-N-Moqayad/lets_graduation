class Video {
 late int id;
 late String title;
 late String body;
 late String category;
 late String gender;
 late String youtube;
 late String image;
 late String updatedAt;
 late String createdAt;

  Video.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    category = json['category'];
    gender = json['gender'];
    youtube = json['youtube'];
    image = json['image'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}
