import 'dart:convert';
import 'package:chatter_box/common/entities/entities.dart';
import 'package:chatter_box/common/routes/names.dart';
import 'package:chatter_box/common/services/services.dart';
import 'package:chatter_box/common/values/values.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 是否登录
  final _isLogin = false.obs;
  // 令牌 token
  String token = '';
  // 用户 profile
  final _profile = UserItem().obs;

  bool get isLogin => _isLogin.value;
  UserItem get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(storageUserTokenKey);
    var profileOffline = StorageService.to.getString(storageUserProfileKey);
    if (profileOffline.isNotEmpty) {
      _isLogin.value = true;
      _profile(UserItem.fromJson(jsonDecode(profileOffline)));
    }
  }

  // saving token
  Future<void> setToken(String value) async {
    await StorageService.to.setString(storageUserTokenKey, value);
    token = value;
  }

  // get profile
  Future<String> getProfile() async {
    if (token.isEmpty) return "";
    // var result = await UserAPI.profile();
    // _profile(result);
    // _isLogin.value = true;
    return StorageService.to.getString(storageUserProfileKey);
  }

  // save profile
  Future<void> saveProfile(UserItem profile) async {
    _isLogin.value = true;
    StorageService.to.setString(storageUserProfileKey, jsonEncode(profile));
    _profile(profile);
    setToken(profile.accessToken!);
  }

  // during logout
  Future<void> onLogout() async {
    // if (_isLogin.value) await UserAPI.logout();
    await StorageService.to.remove(storageUserTokenKey);
    await StorageService.to.remove(storageUserProfileKey);
    _isLogin.value = false;
    token = '';
    Get.offAllNamed(AppRoutes.signIN);
  }
}
