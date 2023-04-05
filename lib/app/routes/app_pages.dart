import 'package:get/get.dart';
import 'package:mini_e_learning/app/modules/question/views/result_view.dart';

import '../modules/biodata/bindings/biodata_binding.dart';
import '../modules/biodata/views/biodata_view.dart';
import '../modules/course/views/course_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/page/Home/views/home_view.dart';
import '../modules/dashboard/page/Profile/views/edit_profile_view.dart';
import '../modules/dashboard/page/Profile/views/profile_view.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dashboard/page/Discus/views/discus_view.dart';
import '../modules/exercise/bindings/exercise_binding.dart';
import '../modules/exercise/views/exercise_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/question/bindings/question_binding.dart';
import '../modules/question/views/question_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.biodata,
      page: () => const BiodataView(),
      binding: BiodataBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.profile,
      page: () => const ProfileView(),
    ),
    GetPage(
      name: _Paths.editProfile,
      page: () => const EditProfileView(),
    ),
    GetPage(
      name: _Paths.course,
      page: () => const CourseView(),
    ),
    GetPage(
      name: _Paths.exercise,
      page: () => const ExerciseView(),
      binding: ExerciseBinding(),
    ),
    GetPage(
      name: _Paths.question,
      page: () => const QuestionView(),
      binding: QuestionBinding(),
    ),
    GetPage(
      name: _Paths.discus,
      page: () => const DiscusView(),
    ),
    GetPage(
      name: _Paths.result,
      page: () => const ResultView(),
    ),
  ];
}
