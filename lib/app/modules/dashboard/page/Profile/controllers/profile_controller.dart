import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_e_learning/app/data/services/firebase_service.dart';

import '../../../../../data/models/user_model.dart';
import '../../../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  final FirebaseServices firebase;
  ProfileController(this.firebase);

  UserModel userData = Get.arguments;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameTextController = TextEditingController(text: '');
  TextEditingController emailTextController = TextEditingController(text: '');
  TextEditingController kelaminTextController = TextEditingController(text: '');
  TextEditingController kelasTextController = TextEditingController(text: '');
  TextEditingController sekolahTextController = TextEditingController(text: '');

  @override
  void onInit() {
    super.onInit();
    nameTextController.text = userData.data!.userName!;
    emailTextController.text = userData.data!.userEmail!;
    kelaminTextController.text = userData.data!.userGender!;
    kelasTextController.text = userData.data!.kelas!;
    sekolahTextController.text = userData.data!.userAsalSekolah!;
    log('cek ${nameTextController.text}');
    update();
  }

  Future<void> signOut() async {
    await firebase.signOut();
    Get.offAllNamed(Routes.login);
  }

  Future<void> updateUser() async {}
}
