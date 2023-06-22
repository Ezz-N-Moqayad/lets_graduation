import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/entities/entities.dart';
import '../../../common/store/store.dart';

class DoneState {

  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;

  var selectedGender = Gender.non.obs;
  var listener;

  late TextEditingController HeightkgController;
  late TextEditingController HeightCmController;
  late TextEditingController LocationController;
}
