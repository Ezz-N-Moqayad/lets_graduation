import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterState {
  RxBool isPasswordHidden = true.obs;
  RxBool isConfirmPasswordHidden = true.obs;
  bool isVisiblePass = true;
  bool isVisiblePassCon = true;
  IconData visiblePassIcon = Icons.visibility;
  IconData visiblePassCon = Icons.visibility;

  late TextEditingController NameController;
  late TextEditingController EmailController;
  late TextEditingController PasswordController;
  late TextEditingController ConfirmPasswordController;
}
