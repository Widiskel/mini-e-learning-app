import 'package:get/get.dart';
import 'package:mini_e_learning/app/data/repository/banner_repository.dart';
import 'package:mini_e_learning/app/data/repository/course_repository.dart';
import 'package:mini_e_learning/app/data/services/dio_client.dart';
import 'package:mini_e_learning/app/modules/dashboard/page/Profile/controllers/profile_controller.dart';

import '../page/Home/controllers/home_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<CourseRepository>(() => CourseRepositoryImpl(Get.find()));
    Get.lazyPut<BannerRepository>(() => BannerRepositoryImpl(Get.find()));

    Get.lazyPut<HomeController>(
      () => HomeController(Get.find(), Get.find()),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
