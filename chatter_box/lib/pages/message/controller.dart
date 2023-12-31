import 'package:chatter_box/common/routes/names.dart';
import 'package:get/get.dart';

import 'index.dart';

class MessageController extends GetxController {
  MessageController();

  final state = MessageState();

  void goProfile() async {
    await Get.toNamed(AppRoutes.profile);
  }
}
