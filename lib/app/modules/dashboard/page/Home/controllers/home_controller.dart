import 'package:get/get.dart';
import 'package:mini_e_learning/app/data/models/banner_list_model.dart';
import 'package:mini_e_learning/app/data/models/course_list_model.dart';
import 'package:mini_e_learning/app/data/models/user_model.dart';
import 'package:mini_e_learning/app/data/repository/banner_repository.dart';
import 'package:mini_e_learning/app/data/repository/course_repository.dart';

import '../../../../../widget/snackbar_widget.dart';

class HomeController extends GetxController {
  final CourseRepository courseRepo;
  final BannerRepository bannerRepo;

  HomeController(this.bannerRepo, this.courseRepo);

  @override
  void onInit() async {
    super.onInit();
    getCourseList();
    getBannerList();
  }

  UserModel userData = Get.arguments;
  List<CourseList> courseList = [];
  List<BannerList> bannerList = [
    BannerList(eventImage: 'assets/img/placeholder.png'),
    BannerList(eventImage: 'assets/img/placeholder.png'),
    BannerList(eventImage: 'assets/img/placeholder.png'),
  ];

  Future<void> getCourseList() async {
    try {
      courseList = [];
      update();
      CourseListModel? courseData =
          await courseRepo.getCourse('IPA', userData.data!.userEmail!);
      if (courseData?.data != null) {
        courseList = courseData!.data!;
        update();
      } else {
        ErrorSnack.show(message: 'Terjadi Kesalahan');
      }
    } catch (e) {
      ErrorSnack.show(message: 'Terjadi Kesalahan');
    }
  }

  Future<void> getBannerList() async {
    try {
      BannerListModel? bannerData = await bannerRepo.getBanner();
      if (bannerData?.data != null) {
        bannerList = bannerData!.data!;
        update();
      } else {
        ErrorSnack.show(message: 'Terjadi Kesalahan');
      }
    } catch (e) {
      ErrorSnack.show(message: 'Terjadi Kesalahan');
    }
  }
}