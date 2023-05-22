import '../../../common/entities/entities.dart';
import 'package:get/get.dart';

class SettingsState {
  var head_detail = Rx<UserLoginResponseEntity?>(null);
  RxList<MeListItem> meListItem = <MeListItem>[].obs;
}
