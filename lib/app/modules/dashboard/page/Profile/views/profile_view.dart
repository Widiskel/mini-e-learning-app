// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_e_learning/app/data/utils/color_pallete.dart';

import '../../../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: kToolbarHeight,
            color: ColorPallete.bgColor,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  child: Text(
                    'My App',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.editProfile);
                    },
                    child: Text(
                      'Edit',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<ProfileController>(
            builder: (controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 20),
                    width: Get.width,
                    height: 150,
                    decoration: BoxDecoration(
                      color: ColorPallete.bgColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.userData.data!.userName!,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                controller.userData.data!.userAsalSekolah!,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                controller.userData.data!.userFoto!,
                              ),
                              child: FadeInImage(
                                placeholder:
                                    AssetImage('assets/img/avatar.png'),
                                fit: BoxFit.contain,
                                imageErrorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Image.asset('assets/img/avatar.png');
                                },
                                image: NetworkImage(
                                  controller.userData.data!.userFoto!,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 7,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Identitas Diri',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Nama Lengkap',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: ColorPallete.subTitle,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          controller.userData.data!.userName!,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Email',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: ColorPallete.subTitle,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          controller.userData.data!.userEmail!,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Jenis Kelamin',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: ColorPallete.subTitle,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          controller.userData.data!.userGender!,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Kelas',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: ColorPallete.subTitle,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          controller.userData.data!.kelas!,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Sekolah',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: ColorPallete.subTitle,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          controller.userData.data!.userAsalSekolah!,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.signOut();
                    },
                    child: Container(
                      width: Get.width,
                      height: 50,
                      margin: EdgeInsets.only(left: 16, top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 6,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.logout),
                            onPressed: () {
                              // Implement logout functionality here
                            },
                          ),
                          Text(
                            "Logout",
                            style: GoogleFonts.poppins(
                              color: Colors.red,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
