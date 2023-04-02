import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_e_learning/app/data/utils/color_pallete.dart';
import 'package:mini_e_learning/app/modules/dashboard/page/Home/controllers/home_controller.dart';

import '../../../routes/app_pages.dart';
import '../../../widget/course_widget.dart';

class CourseView extends GetView<HomeController> {
  const CourseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColorWhite,
      appBar: AppBar(
        backgroundColor: ColorPallete.bgColor,
        title: Text(
          'Pilih Pelajaran',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.courseList.length,
            itemBuilder: (context, index) {
              if (controller.courseList.isNotEmpty) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    CourseWidget(
                      leading: controller.courseList[index].urlCover!,
                      title: controller.courseList[index].courseName!,
                      materi: controller.courseList[index].jumlahMateri!,
                      done: controller.courseList[index].jumlahDone!,
                      route: Routes.exercise,
                      argument: {
                        "courseId": controller.courseList[index].courseId,
                        "email": controller.userData.data?.userEmail!,
                        "title": controller.courseList[index].courseName,
                      },
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      color: ColorPallete.bgColor,
                      strokeWidth: 10,
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
