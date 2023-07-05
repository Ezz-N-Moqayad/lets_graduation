import 'models.dart';

class BaseGenericArrayResponse<T> {
  late String status;
  late List<T>? message;
  late int errors;

  BaseGenericArrayResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      if (T == Gym) {
        message = <T>[];
        json['message'].forEach((v) {
          message!.add(Gym.fromJson(v) as T);
        });
      }
      if (T == Video) {
        message = <T>[];
        json['message'].forEach((v) {
          message!.add(Video.fromJson(v) as T);
        });
      }
    }
    errors = json['errors'];
  }
}
