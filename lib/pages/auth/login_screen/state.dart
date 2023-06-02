import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginState {
  RxBool isPasswordHidden = true.obs;
  RxBool isLoading = false.obs;
  bool isVisiblePass = true;
  bool isVisiblePassCon = true;
  IconData visiblePassIcon = Icons.visibility;
  IconData visiblePassCon = Icons.visibility;

  late GlobalKey<FormState> formKey;
  late GlobalKey<FormState> formKeyPassword;
  late TextEditingController emailController;
  late TextEditingController passwordController;
}
