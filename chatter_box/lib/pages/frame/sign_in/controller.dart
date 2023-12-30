import 'package:chatter_box/common/entities/entities.dart';
import 'package:chatter_box/common/routes/names.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'index.dart';

class SignInController extends GetxController {
  SignInController();

  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['openid']);

  void hanleSignIn(String type) async {
    //1 : email , 2: google, 3: facebook, 4: apple, 5: phone
    try {
      if (type == "phone number") {
        if (kDebugMode) {
          print("...you are loggin in with phone number...");
        }
      } else if (type == "google") {
        try {
          var user = await _googleSignIn.signIn();
          if (user != null) {
            String? displayName = user.displayName;
            String email = user.email;
            String id = user.id;
            String photoUrl = user.photoUrl ?? "assets/icons/google.png";
            LoginRequestEntity loginPanelListEntityRequestEntity =
                LoginRequestEntity();
            loginPanelListEntityRequestEntity.avatar = photoUrl;
            loginPanelListEntityRequestEntity.name = displayName;
            loginPanelListEntityRequestEntity.email = email;
            loginPanelListEntityRequestEntity.openId = id;
            loginPanelListEntityRequestEntity.type = 2;
            asyncPostAlldata();
          } else {
            if (kDebugMode) {
              print("...login type not sure...");
            }
          }
        } catch (e) {
          if (kDebugMode) {
            print('...error with login $e');
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('...error with login $e');
      }
    }
  }

  asyncPostAlldata() {
    Get.offAllNamed(AppRoutes.message);
  }
}
