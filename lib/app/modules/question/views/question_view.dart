import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_e_learning/app/data/utils/color_pallete.dart';

import '../controllers/question_controller.dart';

class QuestionView extends GetView<QuestionController> {
  const QuestionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPallete.bgColor,
        title: Text(
          'Latihan Soal',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<QuestionController>(builder: (controller) {
        if (controller.isLoading) {
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
        } else {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 65,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    controller.questionLength,
                    (index) => SizedBox(
                      height: 60,
                      width: 60,
                      child: IconButton(
                        icon: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: controller.answeredQuestion.contains(index)
                                ? ColorPallete.bgColor
                                : ColorPallete.bgColorWhite,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: ColorPallete.bgColor,
                                width: index == controller.currentQuestionIndex
                                    ? 3
                                    : 1),
                          ),
                          child: Text(
                            '${index + 1}',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight:
                                  index == controller.currentQuestionIndex
                                      ? FontWeight.w800
                                      : FontWeight.w400,
                              color: controller.answeredQuestion.contains(index)
                                  ? Colors.white
                                  : index == controller.currentQuestionIndex
                                      ? ColorPallete.bgColor
                                      : Colors.black,
                            ),
                          ),
                        ),
                        onPressed: () {
                          controller.currentQuestionIndex = index;
                          controller.update();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
