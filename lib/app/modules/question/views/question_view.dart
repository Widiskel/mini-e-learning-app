import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_e_learning/app/data/utils/color_pallete.dart';

import '../../../widget/answer_option_widget.dart';
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
      body: GetBuilder<QuestionController>(
        builder: (controller) {
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
            if (controller.questionList.isNotEmpty) {
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
                                color:
                                    controller.answeredQuestion.contains(index)
                                        ? ColorPallete.bgColor
                                        : ColorPallete.bgColorWhite,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: ColorPallete.bgColor,
                                    width:
                                        index == controller.currentQuestionIndex
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
                                  color: controller.answeredQuestion
                                          .contains(index)
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
                  SizedBox(
                    width: Get.width,
                    height: Get.height * 0.8,
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              'Soal nomor ${controller.currentQuestionIndex + 1}',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorPallete.subTitle),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: HtmlWidget(controller
                              .questionList[controller.currentQuestionIndex]
                              .questionTitle!),
                        ),
                        controller.questionList[controller.currentQuestionIndex]
                                    .questionTitleImg !=
                                null
                            ? Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Image.network(
                                  controller
                                      .questionList[
                                          controller.currentQuestionIndex]
                                      .questionTitleImg!,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: ColorPallete.bgColor,
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Center(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        AnswerWidget(
                            option: 'A',
                            question: controller
                                .questionList[controller.currentQuestionIndex]
                                .optionA,
                            questionImg: controller
                                .questionList[controller.currentQuestionIndex]
                                .optionAImg,
                            controller: controller),
                        AnswerWidget(
                            option: 'B',
                            question: controller
                                .questionList[controller.currentQuestionIndex]
                                .optionB,
                            questionImg: controller
                                .questionList[controller.currentQuestionIndex]
                                .optionBImg,
                            controller: controller),
                        AnswerWidget(
                            option: 'C',
                            question: controller
                                .questionList[controller.currentQuestionIndex]
                                .optionC,
                            questionImg: controller
                                .questionList[controller.currentQuestionIndex]
                                .optionCImg,
                            controller: controller),
                        AnswerWidget(
                            option: 'D',
                            question: controller
                                .questionList[controller.currentQuestionIndex]
                                .optionD,
                            questionImg: controller
                                .questionList[controller.currentQuestionIndex]
                                .optionDImg,
                            controller: controller),
                        AnswerWidget(
                          option: 'E',
                          question: controller
                              .questionList[controller.currentQuestionIndex]
                              .optionE,
                          questionImg: controller
                              .questionList[controller.currentQuestionIndex]
                              .optionEImg,
                          controller: controller,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: UnconstrainedBox(
                            child: Container(
                              width: 135,
                              height: 33,
                              margin: const EdgeInsets.only(
                                  right: 20, left: 20, top: 10),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (controller.answerList.length ==
                                          controller.questionLength &&
                                      !controller.answerList.contains('')) {
                                    return showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(12.0),
                                        ),
                                      ),
                                      builder: (BuildContext context) {
                                        return Wrap(children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(12.0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Container(
                                                  height: 6,
                                                  width: Get.width * 0.3,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: ColorPallete
                                                        .bgColorForm,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(12.0),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 22.0,
                                                ),
                                                Image.asset(
                                                  'assets/img/submit.png',
                                                  width: 290,
                                                  height: 120.0,
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                Text(
                                                  'Kumpulkan latihan soal sekarang?',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  'Boleh langsung kumpulin dong',
                                                  style: GoogleFonts.poppins(
                                                      color:
                                                          ColorPallete.subTitle,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                const SizedBox(height: 20.0),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 125,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            side: const BorderSide(
                                                                color:
                                                                    ColorPallete
                                                                        .bgColor,
                                                                width: 1,
                                                                style:
                                                                    BorderStyle
                                                                        .solid),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          'Nanti dulu',
                                                          style: GoogleFonts.poppins(
                                                              color:
                                                                  ColorPallete
                                                                      .bgColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    SizedBox(
                                                      width: 125,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          controller.submit();
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              ColorPallete
                                                                  .bgColor,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          'Ya',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 40.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]);
                                      },
                                    );
                                  } else {
                                    controller.answeredQuestion
                                        .add(controller.currentQuestionIndex);
                                    controller.currentQuestionIndex += 1;
                                    controller.update();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorPallete.bgColor),
                                child: controller.answerList.length ==
                                            controller.questionLength &&
                                        !controller.answerList.contains('')
                                    ? Text(
                                        'Kumpulkan',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        'Selanjutnya',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100.0,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Image.asset(
                  "assets/img/notfound.png",
                  width: 360.0,
                  height: 290.0,
                  fit: BoxFit.contain,
                ),
              );
            }
          }
        },
      ),
    );
  }
}
