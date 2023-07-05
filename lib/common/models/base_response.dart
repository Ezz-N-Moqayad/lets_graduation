class BaseResponse {
  late String status;
  late String message;
  late int errors;

  BaseResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
  }
}
