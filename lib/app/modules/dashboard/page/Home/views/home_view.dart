import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_e_learning/app/widget/course_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../data/utils/color_pallete.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../widget/list_view_shimmer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  Future<void> _onRefresh() async {
    await controller.getCourseList();
    await controller.getBannerList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColorWhite,
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.only(
                      top: 10, left: 20, right: 20, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Hai, ${controller.userData.data?.userEmail}",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Selamat Datang",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/img/avatar.png",
                        width: 35.0,
                        height: 35.0,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: Get.width,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/img/vector-ppl.png'),
                              alignment: AlignmentDirectional.bottomEnd),
                          color: ColorPallete.bgColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(20),
                              width: Get.width * 0.3,
                              child: Text(
                                'Mau kerjain latihan soal apa hari ini ?',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 25, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pilih Pelajaran',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(Routes.course),
                              child: Text(
                                'Lihat Semua',
                                style: GoogleFonts.poppins(
                                    fontSize: 10, color: ColorPallete.bgColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.courseList.length,
                          itemBuilder: (context, index) {
                            if (controller.isLoading) {
                              return const MyListViewShimmer();
                            } else {
                              if (controller.courseList.isNotEmpty) {
                                return CourseWidget(
                                  leading:
                                      controller.courseList[index].urlCover!,
                                  title:
                                      controller.courseList[index].courseName!,
                                  materi: controller
                                      .courseList[index].jumlahMateri!,
                                  done:
                                      controller.courseList[index].jumlahDone!,
                                  route: Routes.exercise,
                                  argument: {
                                    "courseId":
                                        controller.courseList[index].courseId,
                                    "email":
                                        controller.userData.data?.userEmail!,
                                    "title":
                                        controller.courseList[index].courseName,
                                  },
                                );
                              } else {
                                return Center(
                                  child: Text(
                                    "Saat ini tidak ada pelajaran tersedia",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 20),
                          child: Text(
                            'Terbaru',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Builder(builder: (context) {
                        return CarouselSlider(
                          options: CarouselOptions(
                            height: 140.0,
                            autoPlay: true,
                            enlargeCenterPage: true,
                          ),
                          items: controller.bannerList.map((banner) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: Get.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    child: GestureDetector(
                                      onTap: () async {
                                        if (banner.eventId != null) {
                                          log('Launch Url');
                                          launchUrl(
                                              Uri.parse(banner.eventUrl!));
                                        }
                                      },
                                      child: FadeInImage(
                                        placeholder: const AssetImage(
                                            'assets/img/placeholder.png'),
                                        image: NetworkImage(banner.eventImage),
                                        imageErrorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/img/placeholder.png',
                                            fit: BoxFit.cover,
                                          );
                                        },
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        );
                      }),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
