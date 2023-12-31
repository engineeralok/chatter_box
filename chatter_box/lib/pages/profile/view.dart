import 'package:chatter_box/common/style/style.dart';
import 'package:chatter_box/common/values/colors.dart';
import 'package:chatter_box/pages/profile/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  AppBar _builAppbar() {
    return AppBar(
      title: Text(
        "Profile",
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.2,
          decoration: BoxDecoration(
            color: AppColors.primarySecondaryBackground,
            borderRadius: BorderRadius.all(Radius.circular(60.w)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: const Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/account_header.png"),
          ),
        ),
        Positioned(
            bottom: 20.w,
            right: 8.w,
            height: 35.w,
            child: GestureDetector(
              child: Container(
                height: 35.w,
                width: 35.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.all(Radius.circular(40.r)),
                ),
                child: Image.asset(
                  "assets/icons/edit.png",
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildCompleteBtn() {
    return GestureDetector(
      child: Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(top: 60.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: AppColors.primaryElement,
          borderRadius: BorderRadius.all(Radius.circular(5.w)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Complete",
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutBtn() {
    return GestureDetector(
      child: Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(top: 60.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: AppColors.primarySecondaryElementText,
          borderRadius: BorderRadius.all(Radius.circular(5.w)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Logout",
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Get.defaultDialog(
          backgroundColor: Colors.white,
          title: "Are you sure to log out?",
          content: Container(),
          onConfirm: () {
            if (kDebugMode) {
              print("...It's time to log out...");
            }
            controller.goLogout();
          },
          onCancel: () {},
          textConfirm: "Confirm",
          confirmTextColor: Colors.white,
          textCancel: "Cancel",
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _builAppbar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildProfilePhoto(),
                  _buildCompleteBtn(),
                  _buildLogoutBtn(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
