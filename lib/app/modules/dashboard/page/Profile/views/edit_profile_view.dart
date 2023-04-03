import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_e_learning/app/modules/dashboard/page/Profile/controllers/profile_controller.dart';

import '../../../../../data/utils/color_pallete.dart';
import '../../../../../widget/edit_form_widget.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColorWhite,
      appBar: AppBar(
        backgroundColor: ColorPallete.bgColor,
        title: Text(
          'Edit Akun',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<ProfileController>(
          builder: (controller) {
            return Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        'Data Diri',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      EditFormInput(
                        label: 'Nama Lengkap',
                        controller: controller.nameTextController,
                      ),
                      EditFormInput(
                        label: 'Email',
                        controller: controller.emailTextController,
                        enabled: false,
                      ),
                      EditFormInput(
                        label: 'Jenis Kelamin',
                        controller: controller.kelaminTextController,
                        enabled: false,
                      ),
                      EditFormInput(
                        label: 'Kelas',
                        controller: controller.kelasTextController,
                      ),
                      EditFormInput(
                        label: 'Sekolah',
                        controller: controller.sekolahTextController,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        height: 50,
                        width: Get.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPallete.bgColor,
                          ),
                          onPressed: () {},
                          child: Text(
                            "Perbarui Data",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
