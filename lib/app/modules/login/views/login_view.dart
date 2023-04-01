import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_e_learning/app/data/utils/color_pallete.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColorWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 40, top: 50),
            child: Text(
              "Login",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Image.asset(
            "assets/img/analys.png",
            width: 360.0,
            height: 255.0,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 60.0,
          ),
          Text(
            'Selamat Datang',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              'Selamat Datang di Aplikasi Wskel Edu Aplikasi Latihan dan Konsultasi Soal',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                width: Get.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: ColorPallete.strokeGreen),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                child: Material(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                  child: InkWell(
                    splashColor: ColorPallete.bgColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    onTap: () async {
                      await controller.onGoogleSignIn();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icon/google.png",
                          width: 25.0,
                          height: 25.0,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          "Masuk dengan Google",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
