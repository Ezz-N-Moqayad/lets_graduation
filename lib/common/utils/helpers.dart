import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin Helpers {
  void showSnackBar({required String message, bool error = false}) {
    Get.snackbar(
      error ? "Error" : "Success",
      message,
      backgroundColor: error ? Colors.red : Colors.green,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.horizontal,
    );
  }
}
