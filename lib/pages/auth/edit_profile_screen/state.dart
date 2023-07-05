import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/models/models.dart';
import '../../../common/store/store.dart';

class EditProfileState {
  final db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final token = UserStore.to.token;

  final RxString imagePath = ''.obs;
  File? photo;
  final ImagePicker picker = ImagePicker();

  var selectedGender = Gender.non.obs;

  late TextEditingController NameController = TextEditingController();
  late TextEditingController WidthKgController = TextEditingController();
  late TextEditingController HeightCmController = TextEditingController();
  late TextEditingController LocationController = TextEditingController();
  RxString photoUrl = "".obs;

}
