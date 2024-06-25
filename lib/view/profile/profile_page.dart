import 'package:ecom_matrix/controller/main/main_controller.dart';
import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/utils/text_style.dart';
import 'package:ecom_matrix/utils/ui_const.dart';
import 'package:ecom_matrix/view/profile/components/profile_systems_section.dart';
import 'package:ecom_matrix/widget/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainController>().selectedTab.value = 0;
        return false;
      },
      child: Scaffold(
        backgroundColor: grayBg,
        appBar: customAppBar(
            appBarTitle: "Profile",
            context: context,
            appBarBg: grayBg,
            centerTitle: true,
            leadingOnTap: () =>
                Get.find<MainController>().selectedTab.value = 0,
            textColor: Colors.black54,
            actions: [
              InkWell(
                onTap: () {},
                splashColor: Colors.black12,
                child: Row(
                  children: [
                    Text(
                      "Log Out",
                      style: AppTextStyle.tittleBig2(
                          context: context, color: orrageColor),
                    ),
                    gapW(0.5),
                    Icon(
                      Icons.output_outlined,
                      size: 18.sp,
                      color: orrageColor,
                    )
                  ],
                ),
              ),
              gapW(2),
            ],
            notificationPredicate: (p0) => false,
            leadingColor: Colors.black54),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH(4),
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: edgeInsetsAll(2),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey[200]),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://media.licdn.com/dms/image/D5603AQG32jpbOAohaA/profile-displayphoto-shrink_800_800/0/1706410659608?e=2147483647&v=beta&t=9unqi-RGIBC7Z31w2xv4uma9iwmzJxseId2ro0wcSwQ"),
                            radius: 70.sp,
                          ),
                        ),
                        Positioned(
                          right: 10.sp,
                          bottom: 5.sp,
                          child: Container(
                            padding: edgeInsetsAll(1.5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[200],
                                border: Border.all(
                                    width: 1.sp, color: Colors.white)),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 22.sp,
                              color: Colors.black45,
                            ),
                          ),
                        )
                      ],
                    ),
                    gapH(2),
                    Text(
                      "Md. Emon Miah",
                      style: AppTextStyle.tittleBig1(
                          context: context, color: Colors.black54),
                    )
                  ],
                ),
              ),
              gapH(30),
              ProfileSystemsSection(),
              gapH(4),
              Container(
                padding: edgeInsetsSym(2, 2),
                color: whiteBg,
                // decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    _customListTile(
                        context: context,
                        title: "Edit Profile",
                        icon: Icons.person),
                    _customListTile(
                        context: context,
                        title: "Shipping Address",
                        icon: Icons.location_on),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _customListTile(
      {required BuildContext context,
      required String title,
      required IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25.sp,
        color: Colors.black54,
      ),
      title: Text(
        title,
        style: AppTextStyle.tittleSmall2(context: context),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 20.sp,
        color: Colors.black26,
      ),
    );
  }

  Widget gradientContainer() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 100.sp,
          width: 440.sp,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            borderRadius: radiusOnly(0, 0, 40, 40),
            gradient: LinearGradient(
              colors: [Colors.green, Colors.red],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        Positioned(
          top: -30.sp, // Adjust this value to change the crescent shape
          child: Container(
            height: 100.sp,
            width: 440.sp,
            decoration: BoxDecoration(
              borderRadius: radiusOnly(0, 0, 100, 100),
              color: grayBg,
            ),
          ),
        ),
      ],
    );
  }
}
