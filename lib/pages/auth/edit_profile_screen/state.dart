import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/entities/entities.dart';
import '../../../common/store/store.dart';

class EditProfileState {
  final db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final token = UserStore.to.token;

  var selectedGender = Gender.non.obs;

  late TextEditingController NameController;
  late TextEditingController HeightkgController;
  late TextEditingController HeightCmController;
  late TextEditingController LocationController;
}
