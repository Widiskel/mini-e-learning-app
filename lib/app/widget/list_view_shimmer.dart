import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_e_learning/app/data/utils/color_pallete.dart';
import 'package:shimmer/shimmer.dart';

class MyListViewShimmer extends StatelessWidget {
  const MyListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: Get.width,
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: Get.width,
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Shimmer.fromColors(
                    baseColor: ColorPallete.iconBg,
                    highlightColor: ColorPallete.bgColor,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          height: 55,
                          width: 55,
                          decoration: const BoxDecoration(
                            color: ColorPallete.iconBg,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              top: 18, left: 18, right: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width * 0.4,
                                height: 18,
                                margin: const EdgeInsets.only(top: 5),
                                color: ColorPallete.iconBg,
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Container(
                                width: Get.width * 0.5,
                                height: 18,
                                color: ColorPallete.iconBg,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                width: Get.width * 0.6,
                                height: 18,
                                color: ColorPallete.iconBg,
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
