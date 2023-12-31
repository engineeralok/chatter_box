import 'package:chatter_box/common/routes/names.dart';
import 'package:chatter_box/common/store/store.dart';
import 'package:chatter_box/pages/profile/index.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
  ProfileController();

  final title = "Chatter Box .";

  final state = ProfileState();

  Future<void> goLogout() async {
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }
}
