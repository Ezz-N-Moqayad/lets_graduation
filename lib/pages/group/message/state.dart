import 'package:get/get.dart';
import '../../../common/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageState {
  RxList<QueryDocumentSnapshot<Msg>> msgList =
      <QueryDocumentSnapshot<Msg>>[].obs;
}
