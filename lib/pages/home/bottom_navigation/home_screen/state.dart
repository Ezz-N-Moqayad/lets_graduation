import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/models/models.dart';
import '../../../../common/store/store.dart';

class HomeState {
  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;

  var checkGender = Gender.non.obs;

  late TabController tabController;
}
