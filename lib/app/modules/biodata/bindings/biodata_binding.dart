import 'package:get/get.dart';
import 'package:mini_e_learning/app/data/repository/user/user_repository.dart';

import '../../../data/services/dio_client.dart';
import '../controllers/biodata_controller.dart';

class BiodataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<UserRepository>(
        () => UserRepositoryImpl(Get.find<DioClient>()));

    Get.lazyPut(
      () => BiodataController(userRepository: Get.find<UserRepository>()),
    );
  }
}
