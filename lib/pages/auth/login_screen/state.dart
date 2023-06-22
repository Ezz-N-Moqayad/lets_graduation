import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginState {

  final db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
