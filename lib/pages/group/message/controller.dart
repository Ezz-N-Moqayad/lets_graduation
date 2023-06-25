import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../common/store/store.dart';
import '../../../common/entities/entities.dart';
import '../../../common/utils/http.dart';
import 'index.dart';

class MessageController extends GetxController {
  MessageController();

  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;

  final MessageState state = MessageState();
  var listener;

  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  @override
  void onReady() {
    super.onReady();
    getFmcToken();
  }

  void onRefresh() {
    asyncLoadAllData().then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }

  void onLoading() {
    asyncLoadAllData().then((_) {
      refreshController.refreshCompleted();
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }

  asyncLoadAllData() async {
    var from_message = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("from_uid", isEqualTo: token)
        .get();

    var to_messages = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("to_uid", isEqualTo: token)
        .get();

    state.msgList.clear();

    if (from_message.docs.isNotEmpty) {
      state.msgList.assignAll(from_message.docs);
    }
    if (to_messages.docs.isNotEmpty) {
      state.msgList.assignAll(to_messages.docs);
    }
  }

  // getUserLocation() async {
  //   try {
  //     final location = await Location().getLocation();
  //
  //     String address = "${location.latitude} , ${location.longitude}";
  //
  //     String url =
  //         "https://maps.googleapis.com/maps/api/geocode/json?address=${address}&key=AIzaSyDuxj8dmTs7kueuaMDV-XNosobnVPmuD3I";
  //     var response = await HttpUtil().get(url);
  //
  //     MyLocation location_res = MyLocation.fromJson(response);
  //
  //     if (location_res.status == "OK") {
  //       String? myaddresss = location_res.results?.first.formattedAddress;
  //
  //       print(myaddresss);
  //
  //       if (myaddresss != null) {
  //         var user_location =
  //             await db.collection("users").where("id", isEqualTo: token).get();
  //
  //         if (user_location.docs.isNotEmpty) {
  //           var doc_id = user_location.docs.first.id;
  //           await db
  //               .collection("users")
  //               .doc(doc_id)
  //               .update({"location": myaddresss});
  //         }
  //       }
  //     } else {
  //       var user_location =
  //           await db.collection("users").where("id", isEqualTo: token).get();
  //
  //       if (user_location.docs.isNotEmpty) {
  //         var doc_id = user_location.docs.first.id;
  //         await db
  //             .collection("users")
  //             .doc(doc_id)
  //             .update({"location": address});
  //       }
  //     }
  //   } catch (e) {
  //     print("Getting error $e");
  //   }
  // }

  getFmcToken() async {
    print("11111111111111111111111111");
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print("2222222222222");

    print(fcmToken);
    print("2222222222222");

    if (fcmToken != null) {
      print("33333333333333333333");

      print(fcmToken);
      print("33333333333333333333");

      var user =
          await db.collection("users").where("id", isEqualTo: token).get();
      print("444444444444444444");

      print(user);
      print("444444444444444444");

      if (user.docs.isNotEmpty) {
        print("555555555555555555555555");

        var doc_id = user.docs.first.id;
        print("66666666666666666666666");
        print(doc_id);
        print("66666666666666666666666");
        await db.collection("users").doc(doc_id).update({"fcmtoken": fcmToken});
        print("77777777777777777777777");
      }
    }
  }
}
