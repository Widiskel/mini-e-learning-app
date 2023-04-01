import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mini_e_learning/app/data/models/user_model.dart';
import 'package:mini_e_learning/app/data/repository/user/user_repository.dart';
import 'package:mini_e_learning/app/data/services/firebase_service.dart';
import 'package:mini_e_learning/app/widget/snackbar_widget.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final FirebaseServices firebase;
  final UserRepository userRepository;

  LoginController(this.firebase, this.userRepository);

  Future<void> onGoogleSignIn() async {
    try {
      await firebase.signInWithGoogle();
      await isUserRegistered();
    } catch (e) {
      ErrorSnack.show(message: 'Terjadi Kesalahan');
    }
  }

  Future<void> isUserRegistered() async {
    final String? email = FirebaseAuth.instance.currentUser?.email;
    if (email != null) {
      final UserModel? userData = await userRepository.getUserByEmail(email);
      if (userData != null) {
        Get.toNamed(Routes.dashboard);
      } else {
        Get.toNamed(Routes.biodata);
      }
    } else {
      Get.offAllNamed(Routes.login);
    }
  }

  Future<void> signOut() async {
    await firebase.signOut();
    Get.offAllNamed(Routes.login);
  }
}
