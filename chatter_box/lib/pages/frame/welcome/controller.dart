import 'package:chatter_box/common/routes/names.dart';
import 'package:chatter_box/pages/frame/welcome/state.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();

  final title = "Chatter Box .";

  final state = WelcomeState();

  @override
  void onReady() {
    super.onReady();
    print('Welcome Controller');

    Future.delayed(
        const Duration(seconds: 3), () => Get.offAllNamed(AppRoutes.message));
  }
}
